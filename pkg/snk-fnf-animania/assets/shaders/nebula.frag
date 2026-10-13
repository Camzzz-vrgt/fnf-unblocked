#pragma header
// Galaxy shader
// https://www.shadertoy.com/view/lty3Rt
// Created by Frank Hugenroth  /frankenburgh/   07/2015
// Released at nordlicht/bremen 2015

#define SCREEN_EFFECT 0

uniform float iTime;
const vec3 iResolution=vec3(1280.,720.,1.);

// random/hash function
float hash(float n)
{
	return fract(cos(n)*41415.92653);
}

// 2d noise function
float noise(in vec2 x)
{
	vec2 p=floor(x);
	vec2 f=smoothstep(0.,1.,fract(x));
	float n=p.x+p.y*57.;

	return mix(mix(hash(n+0.),hash(n+1.),f.x),
	mix(hash(n+57.),hash(n+58.),f.x),f.y);
}

float noise(in vec3 x)
{
	vec3 p=floor(x);
	vec3 f=smoothstep(0.,1.,fract(x));
	float n=p.x+p.y*57.+113.*p.z;

	return mix(mix(mix(hash(n+0.),hash(n+1.),f.x),
	mix(hash(n+57.),hash(n+58.),f.x),f.y),
	mix(mix(hash(n+113.),hash(n+114.),f.x),
	mix(hash(n+170.),hash(n+171.),f.x),f.y),f.z);
}

mat3 m=mat3(0.,1.60,1.20,-1.60,.72,-.96,-1.20,-.96,1.28);

// Fractional Brownian motion
float fbmslow(vec3 p)
{
	float f=.5000*noise(p);p=m*p*1.2;
	f+=.2500*noise(p);p=m*p*1.3;
	f+=.1666*noise(p);p=m*p*1.4;
	f+=.0834*noise(p);p=m*p*1.84;
	return f;
}

float fbm(vec3 p)
{
	float f=0.,a=1.,s=0.;
	f+=a*noise(p);p=m*p*1.149;s+=a;a*=.75;
	f+=a*noise(p);p=m*p*1.41;s+=a;a*=.75;
	f+=a*noise(p);p=m*p*1.51;s+=a;a*=.65;
	f+=a*noise(p);p=m*p*1.21;s+=a;a*=.35;
	f+=a*noise(p);p=m*p*1.41;s+=a;a*=.75;
	f+=a*noise(p);
	return f/s;
}

void mainImage(out vec4 fragColor,in vec2 fragCoord)
{
	float time=iTime*.1;

	vec2 xy=-1.+2.*fragCoord.xy/iResolution.xy;

	// fade in (1=10sec), out after 8=80sec;
	float fade=min(1.,time*1.)*min(1.,max(0.,15.-time));
	// start glow after 5=50sec
	float fade2=max(0.,time-10.)*.37;
	float glow=max(-.25,1.+pow(fade2,10.)-.001*pow(fade2,25.));

	// get camera position and view direction
	vec3 campos=vec3(500.,850.,-.0-cos((time-1.4)/2.)*2000.);// moving
	vec3 camtar=vec3(0.,0.,0.);

	float roll=.34;
	vec3 cw=normalize(camtar-campos);
	vec3 cp=vec3(sin(roll),cos(roll),0.);
	vec3 cu=normalize(cross(cw,cp));
	vec3 cv=normalize(cross(cu,cw));
	vec3 rd=normalize(xy.x*cu+xy.y*cv+1.6*cw);

	vec3 light=normalize(vec3(0.,0.,0.)-campos);
	float sundot=clamp(dot(light,rd),0.,1.);

	// render sky

	// galaxy center glow
	vec3 col=glow*1.2*min(vec3(1.,1.,1.),vec3(2.,1.,.5)*pow(sundot,100.));
	// moon haze
	col+=.3*vec3(.8,.9,1.2)*pow(sundot,8.);

	// stars
	vec3 stars=85.5*vec3(pow(fbmslow(rd.xyz*312.),7.))*vec3(pow(fbmslow(rd.zxy*440.3),8.));

	// moving background fog
	vec3 cpos=1500.*rd+vec3(831.-time*30.,321.,1000.);
	col+=vec3(.4,.5,1.)*((fbmslow(cpos*.0035)-.5));

	cpos+=vec3(831.-time*33.,321.,999.);
	col+=vec3(.6,.3,.6)*10.*pow((fbmslow(cpos*.0045)),10.);

	cpos+=vec3(3831.-time*39.,221.,999.);
	col+=.03*vec3(.6,0.,0.)*10.*pow((fbmslow(cpos*.0145)),2.);

	// stars
	cpos=1500.*rd+vec3(831.,321.,999.);
	col+=stars*fbm(cpos*.0021);

	// Clouds
	vec2 shift=vec2(time*100.,time*180.);
	vec4 sum=vec4(0,0,0,0);
	float c=campos.y/rd.y;// cloud height
	vec3 cpos2=campos-c*rd;
	float radius=length(cpos2.xz)/1000.;

	if(radius<1.8)
	{
		for(int q=10;q>-10;q--)// layers
		{
			if(sum.w>.999)continue;
			float c=(float(q)*8.-campos.y)/rd.y;// cloud height
			vec3 cpos=campos+c*rd;

			float see=dot(normalize(cpos),normalize(campos));
			vec3 lightUnvis=vec3(.0,.0,.0);
			vec3 lightVis=vec3(1.3,1.2,1.2);
			vec3 shine=mix(lightVis,lightUnvis,smoothstep(0.,1.,see));

			// border
			float radius=length(cpos.xz)/999.;
			if(radius>1.)
			continue;

			float rot=3.*(radius)-time;
			cpos.xz=cpos.xz*mat2(cos(rot),-sin(rot),sin(rot),cos(rot));

			cpos+=vec3(831.+shift.x,321.+float(q)*mix(250.,50.,radius)-shift.x*.2,1330.+shift.y);// cloud position
			cpos*=mix(.0025,.0028,radius);// zoom
			float alpha=smoothstep(.50,1.,fbm(cpos));// fractal cloud density
			alpha*=1.3*pow(smoothstep(1.,0.,radius),.3);// fade out disc at edges
			vec3 dustcolor=mix(vec3(2.,1.3,1.),vec3(.1,.2,.3),pow(radius,.5));
			vec3 localcolor=mix(dustcolor,shine,alpha);// density color white->gray

			float gstar=2.*pow(noise(cpos*21.40),22.);
			float gstar2=3.*pow(noise(cpos*26.55),34.);
			float gholes=1.*pow(noise(cpos*11.55),14.);
			localcolor+=vec3(1.,.6,.3)*gstar;
			localcolor+=vec3(1.,1.,.7)*gstar2;
			localcolor-=gholes;

			alpha=(1.-sum.w)*alpha;// alpha/density saturation (the more a cloud layer\\\'s density, the more the higher layers will be hidden)
			sum+=vec4(localcolor*alpha,alpha);// sum up weightened color
		}

		for(int q=0;q<20;q++)// 120 layers
		{
			if(sum.w>.999)continue;
			float c=(float(q)*4.-campos.y)/rd.y;// cloud height
			vec3 cpos=campos+c*rd;

			float see=dot(normalize(cpos),normalize(campos));
			vec3 lightUnvis=vec3(.0,.0,.0);
			vec3 lightVis=vec3(1.3,1.2,1.2);
			vec3 shine=mix(lightVis,lightUnvis,smoothstep(0.,1.,see));

			// border
			float radius=length(cpos.xz)/200.;
			if(radius>1.)
			continue;

			float rot=3.2*(radius)-time*1.1;
			cpos.xz=cpos.xz*mat2(cos(rot),-sin(rot),sin(rot),cos(rot));

			cpos+=vec3(831.+shift.x,321.+float(q)*mix(250.,50.,radius)-shift.x*.2,1330.+shift.y);// cloud position
			float alpha=.1+smoothstep(.6,1.,fbm(cpos));// fractal cloud density
			alpha*=1.2*(pow(smoothstep(1.,0.,radius),.72)-pow(smoothstep(1.,0.,radius*1.875),.2));// fade out disc at edges
			vec3 localcolor=vec3(0.,0.,0.);// density color white->gray

			alpha=(1.-sum.w)*alpha;// alpha/density saturation (the more a cloud layer\\\'s density, the more the higher layers will be hidden)
			sum+=vec4(localcolor*alpha,alpha);// sum up weightened color
		}
	}
	float alpha=smoothstep(1.-radius*.5,1.,sum.w);
	sum.rgb/=sum.w+.0001;
	sum.rgb-=.2*vec3(.8,.75,.7)*pow(sundot,10.)*alpha;
	sum.rgb+=min(glow,10.)*.2*vec3(1.2,1.2,1.2)*pow(sundot,5.)*(1.-alpha);

	col=mix(col,sum.rgb,sum.w);//*pow(sundot,10.0) );

	// haze
	col=fade*mix(col,vec3(.3,.5,.9),29.*(pow(sundot,50.)-pow(sundot,60.))/(2.+9.*abs(rd.y)));

	#if SCREEN_EFFECT==1
	if(time<2.5)
	{
		// screen effect
		float c=(col.r+col.g+col.b)*.3*(.6+.3*cos(gl_FragCoord.y*1.2543))+.1*(noise((xy+time*2.)*294.)*noise((xy-time*3.)*321.));
		c+=max(0.,.08*sin(10.*time+xy.y*7.2543));
		// flicker
		col=vec3(c,c,c)*(1.-.5*pow(noise(vec2(time*99.,0.)),9.));
	}
	else
	{
		// bam
		float c=clamp(1.-(time-2.5)*6.,0.,1.);
		col=mix(col,vec3(1.,1.,1.),c);
	}
	#endif

	// Vignetting
	vec2 xy2=gl_FragCoord.xy/iResolution.xy;
	col*=vec3(.5,.5,.5)+.25*pow(100.*xy2.x*xy2.y*(1.-xy2.x)*(1.-xy2.y),.5);

	fragColor=vec4(col,1.);
}

void main(){
	// Get the color of the underlying sprite.
	// vec4 textureColor = flixel_texture2D(bitmap, openfl_TextureCoordv);

	// Default to bright yellow for debugging.
	vec4 resultColor=vec4(1.,1.,0.,1.);

	// NOTE: openfl_TextureCoordv is [0, 1] and not [1280, 720]!
	vec2 texCoord=openfl_TextureCoordv.xy*iResolution.xy;

	// Calculate the color to use for this pixel.
	mainImage(resultColor,texCoord);

	gl_FragColor=resultColor;
}

import io, shutil, os
p = 'pkg/friday-night-funkin/Funkin.js'
src = io.open(p, encoding='utf-8', errors='replace').read()
if not os.path.isfile(p + '.bak2'):
    shutil.copyfile(p, p + '.bak2')
needle = 'lime_utils_Log.verbose("Preloading asset: " + id'
if 'window.__pre' not in src:
    i = src.index(needle)
    src = src[:i] + 'try{(window.__pre=window.__pre||[]).push(id+"|"+this.types.h[id]+"|"+this.getPath(id))}catch(_e){}\n\t\t\t\t' + src[i:]
    src = src.replace('__assetLoaded: function(id) {',
                      '__assetLoaded: function(id) { try{(window.__preOk=window.__preOk||[]).push(id)}catch(_e){}', 1)
    src = src.replace('load_onError: function(id,message) {',
                      'load_onError: function(id,message) { try{(window.__preErr=window.__preErr||[]).push(id+"|"+message)}catch(_e){}', 1)
io.open(p, 'w', encoding='utf-8').write(src)
print('instrumented:', '__pre' in src)

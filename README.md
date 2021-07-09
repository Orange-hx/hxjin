# hxjin

Haxe externs for [Chai](https://github.com/chaifix)'s [Jin](https://github.com/chaifix/jin) game engine.

### Usage

1. Grap Jin from releases [here](https://github.com/chaifix/Jin/releases)
2. Use `haxelib install hxjin` to install the externs!
3. In your Haxe code import externs via `import hxjin.Jin;`
4. Define `-D lua_vanilla` and `-L hxjin` in your build HXML targeting Lua!
5. Build targeting Lua to directory, Then `jin <dirname>` and will works!

### Example

```haxe
package;
import hxjin.Jin;

class Main {
    public static function main() {
        function onLoad() {}

        function onEvent(e: JinEvent) {
            if (e.type == "quit") {
                Jin.core.quit();
            }
        }

        function onDraw() {    
            Jin.graphics.circle("fill", 10, 10, 20);
            Jin.graphics.write("hello, world", 100, 100, 16, 1, 20);
        }

        function onUpdate(dt: Float) {}
        
        // HACK: Assign the Lua events to Haxe functions...
        untyped __lua__("jin.core.load          = onLoad");
        untyped __lua__("jin.core.onEvent       = onEvent");
        untyped __lua__("jin.core.onDraw        = onDraw");
        untyped __lua__("jin.core.onUpdate      = onUpdate");
    }
}
```

### Changes

1. `jin` changed to `Jin` to comply with Haxe.
2. Due to how Haxe generates Lua, Callbacks disabled and won't work, So to do callbacks use `untyped __lua__` stuff like example above.

### License

```
This is free and unencumbered software released into the public domain.
Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
```

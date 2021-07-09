package hxjin;

import haxe.extern.EitherType;

@:multiReturn
extern class JinDimensions {
    var width: Float;
    var height: Float;
}

extern class JinImage {
    public function new();
    public function getSize(): JinDimensions;
    public function getWidth(): Int;
    public function getHeight(): Int;
    public function getPixel(x: Float, y: Float): JinColor;
    public function setAnchor(x: Float, y: Float): Void;
}

extern class JinCanvas {
    public function new();
    public function getWidth(): Int;
    public function getHeight(): Int;
    public function getSize(): JinDimensions;
    public function setAnchor(): Void;
}

extern class JinFont {
    public function new();
    public function box(text: String, fontheight: Float, spacing: Float, lineheight: Float): JinDimensions;
}

@:multiReturn
extern class JinColor {
    var r: Int;
    var g: Int;
    var b: Int;
    var a: Int;
}

@:enum abstract JinMode(String) {
    var FILL = "fill";
    var LINE = "line";
}

extern class JinGraphicsModule {
    public function new();
    @:luaDotMethod public function size(): JinDimensions;
    @:luaDotMethod public function Image(file: String): JinImage;
    @:luaDotMethod public function Canvas(width: Int, height: Int): JinCanvas;
    @:luaDotMethod public function Font(file: String): JinFont;
    @:luaDotMethod public function study(font: JinFont): Void;
    @:luaDotMethod public function box(text: String): JinDimensions;
    @:luaDotMethod public function write(text: String, posx: Float, posy: Float, fontheight: Float, spacing: Float, lineheight: Float): Void;
    @:luaDotMethod public function clear(?r: Int, ?g: Int, ?b: Int, ?a: Int): Void;
    @:luaDotMethod public function draw(?canvas_or_image: EitherType<JinCanvas, JinImage>, posx: Float, posy: Float, ?scalex: Float, ?scaley: Float, ?rotation: Float): Void;
    @:luaDotMethod public function color(?r: Int, ?g: Int, ?b: Int, ?a: Int): Void;
    @:luaDotMethod public function palette(): JinColor;
    @:luaDotMethod public function bind(?canvas: JinCanvas): Void;
    @:luaDotMethod public function point(x: Float, y: Float): Void;
    @:luaDotMethod public function line(x1: Float, y1: Float, x2: Float, y2: Float): Void;
    @:luaDotMethod public function rect(mode: EitherType<String, JinMode>, x: Float, y: Float, w: Float, h: Float): Void;
    @:luaDotMethod public function circle(mode: EitherType<String, JinMode>, x: Float, y: Float, r: Float): Void;
    @:luaDotMethod public function triangle(mode: EitherType<String, JinMode>, x: Float, y: Float, x1: Float, y1: Float, x2: Float, y2: Float): Void;
    @:luaDotMethod public function polygon(mode: EitherType<String, JinMode>, n: Int, ?x1: Float, ?y1: Float, ?x2: Float, ?y2: Float): Void;
}

typedef JinEvent = {
    var ?type: String;
    var ?key: String;
    var ?button: String;
    var ?x: EitherType<Float, String>;
    var ?y: EitherType<Float, String>;
}

extern class JinCoreModule {
    public function new();
    @:luaDotMethod public function quit(): Void;
    //public var load: Void->Void;
    //public var onEvent: haxe.Constraints.Function;
    //public var onUpdate: Float->Void;
    //public var onDraw: Void->Void;
}

extern class JinKeyboardModule {
    public function new();
    @:luaDotMethod public function isDown(k: String): Void;
}

@:multiReturn
extern class JinVec2 {
    var x: Float;
    var y: Float;
}

extern class JinMouseModule {
    public function new();
    @:luaDotMethod public function position(): JinVec2;
    @:luaDotMethod public function isDown(btn: String): Bool;
}

extern class JinTimeModule {
    public function new();
    @:luaDotMethod public function second(): Float;
    @:luaDotMethod public function sleep(secs: Float): Void;
}

extern class JinFilesystemModule {
    public function new();
    @:luaDotMethod public function isdir(path: String): Bool;
    @:luaDotMethod public function exist(path: String): Bool;
}

extern class JinDebugModule {
    public function new();
    @:luaDotMethod public function print(str: String): Void;
    @:luaDotMethod public function size(bsize: Int): Void;
}

@:native("jin")
extern class Jin {
    @:luaDotMethod public static function author(): String;
    @:luaDotMethod public static function os(): String;
    @:luaDotMethod public static function version(): String;

    public static var core: JinCoreModule;
    public static var keyboard: JinKeyboardModule;
    public static var mouse: JinMouseModule;
    public static var time: JinTimeModule;
    public static var filesystem: JinFilesystemModule;
    public static var debug: JinDebugModule;
    public static var graphics: JinGraphicsModule;
}


package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.Assets;

class PlayState extends FlxState
{
    var chimi:FlxSprite;

    override public function create():Void
    {
        super.create();

        // Fundo branco
        FlxG.camera.bgColor = 0xFFFFFFFF;

        chimi = new FlxSprite();

        // Verifica se XML existe
        if (Assets.exists("assets/chimi.xml"))
        {
            chimi.frames = FlxAtlasFrames.fromSparrow(
                "assets/chimi.png",
                "assets/chimi.xml"
            );

            chimi.animation.addByPrefix("idle", "chimi", 24, true);
            chimi.animation.play("idle");
        }
        else
        {
            chimi.loadGraphic("assets/chimi.png");
        }
        

        chimi.screenCenter();
        add(chimi);
        
            FlxG.sound.playMusic("assets/chimi.ogg", 1, true);

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}
}

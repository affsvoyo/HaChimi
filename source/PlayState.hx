package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.Assets;

class PlayState extends FlxState
{
    var chimi:FlxSprite;
    var currentSet:Int = 0; // 0 = chimi-0, 1 = chimi-1

    override public function create():Void
    {
        super.create();

        // Fundo branco
        FlxG.camera.bgColor = 0xFFFFFFFF;

        chimi = new FlxSprite();

        loadChimiSet(currentSet);

        chimi.screenCenter();
        add(chimi);

        // Música em loop
        FlxG.sound.playMusic("assets/chimi.ogg", 1, true);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        // Quando a animação terminar, troca para o próximo sprite
        if (chimi.animation.curAnim != null && chimi.animation.curAnim.finished)
        {
            currentSet = (currentSet + 1) % 2; // Alterna entre 0 e 1
            loadChimiSet(currentSet);
        }
    }

    function loadChimiSet(set:Int):Void
    {
        var pngPath:String = 'assets/chimi-' + set + '.png';
        var xmlPath:String = 'assets/chimi-' + set + '.xml';

        chimi.animation.destroyAnimations();

        if (Assets.exists(xmlPath))
        {
            chimi.frames = FlxAtlasFrames.fromSparrow(
                pngPath,
                xmlPath
            );

            chimi.animation.addByPrefix("idle", "chimi", 24, false);
            chimi.animation.play("idle", true);
        }
        else
        {
            chimi.loadGraphic(pngPath);
        }

        chimi.screenCenter();
    }
}

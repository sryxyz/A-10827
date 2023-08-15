local useSongCredits = true -- Disable this if you just want the song name!

local songdata = {
    ['Reunion'] = {
    'Reunion', -- Song Name
    'TonyRonii', -- Composer
    '4', --  Length for onscreen
    'HundredPrecent', -- Charter
    'FF0000',
    },  
}

local offsetX = 10
local offsetY = 460
local objWidth = 570


function ifExists(table, valuecheck) -- This stupid function stops your game from throwing up errors when you play a main week song thats not in the Song Data Folder
    if table[valuecheck] then
        return true
    else
        return false
    end
end

function onCreatePost()
    luaDebugMode = true

    if useSongCredits == true then

    makeLuaSprite('creditBox', 'empty', 0 - objWidth, offsetY)
    makeGraphic('creditBox', objWidth, 120, '000000')
    setObjectCamera('creditBox', 'other')
    setProperty("creditBox.alpha", 0.4)
    addLuaSprite('creditBox', true)

    makeLuaText('creditTitle', 'PlaceholderTitle', objWidth, offsetX - objWidth, offsetY+5)
    setTextFont('creditTitle', 'TRIGLE.TTF')
    setTextSize('creditTitle', 35)
    setTextAlignment('creditTitle', 'left')
    setObjectCamera('creditTitle', 'other')
    addLuaText("creditTitle",true)

    makeLuaText('creditComposer', 'PlaceholderComposer', objWidth, offsetX - objWidth, offsetY+50)
    setTextFont('creditComposer', 'TRIGLE.TTF')
    setTextSize('creditComposer', 23)
    setTextAlignment('creditComposer', 'left')
    setObjectCamera('creditComposer', 'other')
    addLuaText("creditComposer",true)

    makeLuaText('creditCharter', 'PlaceholderCharter', objWidth, offsetX - objWidth, offsetY+85)
    setTextFont('creditCharter', 'TRIGLE.TTF')
    setTextSize('creditCharter', 23)
    setTextAlignment('creditCharter', 'left')
    setObjectCamera('creditCharter', 'other')
    addLuaText("creditCharter",true)

    end
end


function onSongStart()

    if useSongCredits == true then
        songExists = ifExists(songdata, songName) -- Checks to see if song exists

        if songExists == true then
            local curSongTable = songdata[songName]
            setProperty('creditBox.color', curSongTable[6])
            setTextString('creditTitle', curSongTable[1]) -- Sets the actual things
            setTextString('creditComposer', "Composer: "..curSongTable[2])
            setTextString('creditCharter', "Charter: "..curSongTable[4])

            --Tweens--
            doTweenX("creditBoxTween", "creditBox", getProperty("creditBox.x") + objWidth, 1, "expoOut")
            doTweenX("creditTitleTween", "creditTitle", getProperty("creditTitle.x") + objWidth, 1, "expoOut")
            doTweenX("creditCharterTween", "creditCharter", getProperty("creditCharter.x") + objWidth, 1, "expoOut")
            doTweenX("creditComposerTween", "creditComposer", getProperty("creditComposer.x") + objWidth, 1, "expoOut")
            runTimer("creditDisplay",curSongTable[3],1)
        end
    end

end

function onTimerCompleted(timerName)

if useSongCredits == true then
    if timerName == "creditDisplay" then
        doTweenX("creditBoxTween", "creditBox", getProperty("creditBox.x") - objWidth, 0.5, "sineIn")
        doTweenX("creditTitleTween", "creditTitle", getProperty("creditTitle.x") - objWidth, 0.5, "sineIn")
        doTweenX("creditComposerTween", "creditComposer", getProperty("creditComposer.x") - objWidth, 0.5, "sineIn")
        doTweenX("creditCharterTween", "creditCharter", getProperty("creditCharter.x") - objWidth, 0.5, "sineIn")
    end
end

end

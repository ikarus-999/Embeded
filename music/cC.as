function fn_initMusic()
{
    _root.fn_InputKeyHandler(KEY_DISPLAY_ROTATE);
    _global.gfn_systemInfo(1);
    ext_fscommand2("EtcModChangeMode", "Music");
    g_PlayRepeat = ext_fscommand2("GetAudRepeat");
    g_PlayShuffle = ext_fscommand2("GetAudShuffle");
    g_PlayBoundary = ext_fscommand2("GetAudBoundary");
    g_PlayABRepeat = ext_fscommand2("GetAudABMode");
    fn_SetBoundary(g_PlayBoundary, 0);
    fn_SetShuffle(g_PlayShuffle, 0);
    fn_SetRepeat(g_PlayRepeat, 0);
    fn_SetABRepeat(g_PlayABRepeat, 1);
    MCPlayMode.MCRepeat.gotoAndStop(g_PlayRepeat + 1);
    MCPlayMode.MCShuffle.gotoAndStop(g_PlayShuffle + 1);
    MCPlayMode.MCBoundary.gotoAndStop(g_PlayBoundary + 1);
    if (_root.gHoldPivot == true && _root.gHoldSwing == true)
    {
        MCFooter.MCSideB.MCSetG.MCSwingPivotOff._visible = true;
        MCFooter.MCSideB.MCSetG.MCSwingOn._visible = false;
        MCFooter.MCSideB.MCSetG.MCPivotOn._visible = false;
    }
    else if (_root.gHoldPivot == true)
    {
        MCFooter.MCSideB.MCSetG.MCSwingPivotOff._visible = false;
        MCFooter.MCSideB.MCSetG.MCSwingOn._visible = true;
        MCFooter.MCSideB.MCSetG.MCPivotOn._visible = false;
    }
    else if (_root.gHoldSwing == true)
    {
        MCFooter.MCSideB.MCSetG.MCSwingPivotOff._visible = false;
        MCFooter.MCSideB.MCSetG.MCSwingOn._visible = false;
        MCFooter.MCSideB.MCSetG.MCPivotOn._visible = true;
    }
    else
    {
        MCFooter.MCSideB.MCSetG.MCSwingPivotOff._visible = false;
        MCFooter.MCSideB.MCSetG.MCSwingOn._visible = false;
        MCFooter.MCSideB.MCSetG.MCPivotOn._visible = true;
    } // end else if
    if (SOL_ASUCI1_MUSIC.data.MCSideB_Show == 1)
    {
        MCFooter.MCSideB.MCMenuShow.MC1._visible = true;
        MCFooter.MCSideB.MCMenuShow.MC2._visible = false;
    }
    else if (SOL_ASUCI1_MUSIC.data.MCSideB_Show == 2)
    {
        MCFooter.MCSideB.MCMenuShow.MC1._visible = false;
        MCFooter.MCSideB.MCMenuShow.MC2._visible = true;
    }
    else
    {
        SOL_ASUCI1_MUSIC.data.MCSideB_Show = 1;
        SOL_ASUCI1_MUSIC.flush();
        MCFooter.MCSideB.MCMenuShow.MC1._visible = true;
        MCFooter.MCSideB.MCMenuShow.MC2._visible = false;
    } // end else if
    switch (g_PlayBoundary)
    {
        case 0:
        {
            MCFooter.MCSideB.MCSetBoundaryON.All._visible = true;
            MCFooter.MCSideB.MCSetBoundaryON.One._visible = false;
            MCFooter.MCSideB.MCSetBoundaryON.Folder._visible = false;
            break;
        } 
        case 1:
        {
            MCFooter.MCSideB.MCSetBoundaryON.All._visible = false;
            MCFooter.MCSideB.MCSetBoundaryON.One._visible = true;
            MCFooter.MCSideB.MCSetBoundaryON.Folder._visible = false;
            break;
        } 
        case 2:
        {
            MCFooter.MCSideB.MCSetBoundaryON.All._visible = false;
            MCFooter.MCSideB.MCSetBoundaryON.One._visible = false;
            MCFooter.MCSideB.MCSetBoundaryON.Folder._visible = true;
            break;
        } 
    } // End of switch
    switch (g_PlayRepeat)
    {
        case 0:
        {
            MCFooter.MCSideB.MCSetBoundaryON.RepeatOff._visible = true;
            MCFooter.MCSideB.MCSetBoundaryON.RepeatOn._visible = false;
            break;
        } 
        case 1:
        {
            MCFooter.MCSideB.MCSetBoundaryON.RepeatOff._visible = false;
            MCFooter.MCSideB.MCSetBoundaryON.RepeatOn._visible = true;
            break;
        } 
    } // End of switch
    switch (g_PlayShuffle)
    {
        case 0:
        {
            MCFooter.MCSideB.MCSetBoundaryON.ShuffleOff._visible = true;
            MCFooter.MCSideB.MCSetBoundaryON.ShuffleOn._visible = false;
            break;
        } 
        case 1:
        {
            MCFooter.MCSideB.MCSetBoundaryON.ShuffleOff._visible = false;
            MCFooter.MCSideB.MCSetBoundaryON.ShuffleOn._visible = true;
            break;
        } 
    } // End of switch
    var _loc4 = ext_fscommand2("GetAudPSpeed");
    MCFooter.MCSideB.MCSetSpeed.MCValue.gotoAndStop(_loc4 + 1);
    if (_loc4 == 10)
    {
        MCFooter.MCSideB.MCSetSpeedON.MCNext._visible = false;
        MCFooter.MCSideB.MCSetSpeedON.MCPNext_Off._visible = true;
    }
    else if (_loc4 == 0)
    {
        MCFooter.MCSideB.MCSetSpeedON.MCPrev._visible = false;
        MCFooter.MCSideB.MCSetSpeedON.MCPrev_Off._visible = true;
    }
    else
    {
        MCFooter.MCSideB.MCSetSpeedON.MCPNext_Off._visible = false;
        MCFooter.MCSideB.MCSetSpeedON.MCPrev_Off._visible = false;
    } // end else if
    fn_PlayInfo_Mode(SOL_ASUCI1_MUSIC.data.PlayInfo_Mode);
    fn_GetFileInfo(1);
    MCPopDRM._visible = false;
    MCPopMsg._visible = false;
    MCPopPlayMode._visible = false;
    MCPopEqSet._visible = false;
    MCPopAlbumMode._visible = false;
    MCPopAdd._visible = false;
    MCPopResult._visible = false;
    gAlbumWidth = _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_C].MCAlbumArt._width;
    gAlbumHeight = _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_C].MCAlbumArt._height;
    gCurrFileNum = -1;
    fn_Reflush_AllDisplay();
    if (gTotalFileNum >= 0 && gCurrFileNum >= 0)
    {
        fn_randomCoverA("C", gCurrFileNum, _root.Album_C);
        fn_Music_Get_AlbumCover(gCurrFileNum, _root.Album_C);
        _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_C]._x = 0;
        fn_Music_Get_AlbumRef(gCurrFileNum);
        var _loc3 = gCurrFileNum - 1;
        if (_loc3 == -1)
        {
            _loc3 = gTotalFileNum - 1;
        } // end if
        fn_randomCoverA("P", _loc3, _root.Album_P);
        fn_Music_Get_AlbumCover(_loc3, _root.Album_P);
        _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_P]._x = -300;
        _loc3 = gCurrFileNum + 1;
        if (_loc3 == gTotalFileNum)
        {
            _loc3 = 0;
        } // end if
        fn_randomCoverA("F", _loc3, _root.Album_F);
        fn_Music_Get_AlbumCover(_loc3, _root.Album_F);
        _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_F]._x = 300;
    } // end if
    MCFooter.MCSideB._visible = false;
    MCFooter.MCSideB._alpha = 100;
    fn_MCSideB_ONPanal_OffAll();
    for (i = 1; i <= 4; i++)
    {
        MCFooter.MCSideB.MCSetEQON["User" + i + "_On"]._visible = false;
    } // end of for
    curJetPresetIndex = ext_fscommand2("GetJetEffectIndex");
    if (curJetPresetIndex <= 3)
    {
        MCFooter.MCSideB.MCSetEQON["User" + (curJetPresetIndex + 1) + "_Off"]._visible = false;
        MCFooter.MCSideB.MCSetEQON["User" + (curJetPresetIndex + 1) + "_On"]._visible = true;
    } // end if
    Menu_Touch._visible = false;
    Menu_Touch_off._visible = false;
    SetVirtualKeyMC;
    _root.ReflushFunc = fn_Reflush_AllDisplay;
    _root.DrawPlayModeFunc = fn_DrawCurrState;
    _root.DrawPlayTimeFunc = fn_SetPlayTime;
    _root.FrameDestroyFunc = fn_Destroy_Fr1;
    MCQuickList._x = 110;
    MCQuickList.MCQuickButton.MCArrow.gotoAndStop(1);
    MCQuickList.MCQuickButton.sw = 1;
    fn_SetLyricState();
    _global.gfn_Key_SetVirtualKeyMC(_root.MCCon.MCAlbum);
    if (gTotalFileNum == 0)
    {
        MCFooter.MCSideB.ICGoList.gotoAndStop(3);
    } // end if
    fn_TXTime_poschange();
} // End of the function
function fn_DestroyFrame()
{
    _global.gfn_Key_SetVirtualKeyMC(null);
    _global.gfn_Key_RemoveKeyListener();
    _global.gfn_Key_RemoveTouchListener();
} // End of the function
function fn_SetRepeat(repeat, act)
{
    if (repeat == 0)
    {
        MCFooter.MCSideB.MCSetBoundaryON.RepeatOn._visible = false;
        MCFooter.MCSideB.MCSetBoundaryON.RepeatOff._visible = true;
    }
    else if (repeat == 1)
    {
        MCFooter.MCSideB.MCSetBoundaryON.RepeatOn._visible = true;
        MCFooter.MCSideB.MCSetBoundaryON.RepeatOff._visible = false;
    } // end else if
    MCPlayMode.MCRepeat.gotoAndStop(repeat + 1);
    if (act == 1)
    {
        ext_fscommand2("SetAudRepeat", repeat);
    } // end if
} // End of the function
function fn_SetShuffle(shuffle, act)
{
    if (shuffle == 0)
    {
        MCFooter.MCSideB.MCSetBoundaryON.ShuffleOn._visible = false;
        MCFooter.MCSideB.MCSetBoundaryON.ShuffleOff._visible = true;
    }
    else if (shuffle == 1)
    {
        MCFooter.MCSideB.MCSetBoundaryON.ShuffleOn._visible = true;
        MCFooter.MCSideB.MCSetBoundaryON.ShuffleOff._visible = false;
    } // end else if
    MCPlayMode.MCShuffle.gotoAndStop(shuffle + 1);
    if (act == 1)
    {
        ext_fscommand2("SetAudShuffle", shuffle);
    } // end if
    fn_SetFileNumber();
} // End of the function
function fn_SetBoundary(boundary, act)
{
    switch (boundary)
    {
        case 0:
        {
            MCFooter.MCSideB.MCSetBoundaryOn.All._visible = true;
            MCFooter.MCSideB.MCSetBoundaryOn.One._visible = false;
            MCFooter.MCSideB.MCSetBoundaryOn.Folder._visible = false;
            break;
        } 
        case 1:
        {
            MCFooter.MCSideB.MCSetBoundaryOn.All._visible = false;
            MCFooter.MCSideB.MCSetBoundaryOn.One._visible = true;
            MCFooter.MCSideB.MCSetBoundaryOn.Folder._visible = false;
            break;
        } 
        case 2:
        {
            MCFooter.MCSideB.MCSetBoundaryOn.All._visible = false;
            MCFooter.MCSideB.MCSetBoundaryOn.One._visible = false;
            MCFooter.MCSideB.MCSetBoundaryOn.Folder._visible = true;
            break;
        } 
    } // End of switch
    MCPlayMode.MCBoundary.gotoAndStop(boundary + 1);
    if (act == 1)
    {
        ext_fscommand2("SetAudBoundary", boundary);
    } // end if
    fn_SetFileNumber();
} // End of the function
function fn_SetABRepeat(ABMode, Redraw)
{
    switch (ABMode)
    {
        case 0:
        {
            MCFooter.MCSideB.MCSetAB.MCReady._visible = true;
            MCFooter.MCSideB.MCSetAB.MCA._visible = false;
            MCFooter.MCSideB.MCSetAB.MCB._visible = false;
            MCSeekBar.MCABSeekBG._visible = false;
            MCSeekBar.MCABSeekMask._width = 0;
            _root.ABModePosition[0] == 0;
            _root.ABModePosition[1] == 0;
            break;
        } 
        case 1:
        {
            MCFooter.MCSideB.MCSetAB.MCReady._visible = false;
            MCFooter.MCSideB.MCSetAB.MCA._visible = true;
            MCFooter.MCSideB.MCSetAB.MCB._visible = false;
            if (Redraw != 1)
            {
                MCSeekBar.MCABSeekBG._visible = true;
                _root.ABmodePosition[0] = MCSeekBar.MCSeeker._x;
                MCSeekBar.MCABSeekMask._x = MCSeekBar.MCSeeker._x;
                MCSeekBar.MCABSeekBG.setMask(MCSeekBar.MCABSeekMask);
            }
            else
            {
                MCSeekBar.MCABSeekMask._x = _root.ABModePosition[0];
                MCSeekBar.MCABSeekMask._width = 1 + MCSeekBar.MCSeeker._x - _root.ABModePosition[0];
                MCSeekBar.MCABSeekBG.setMask(MCSeekBar.MCABSeekMask);
            } // end else if
            break;
        } 
        case 2:
        {
            MCFooter.MCSideB.MCSetAB.MCReady._visible = false;
            MCFooter.MCSideB.MCSetAB.MCA._visible = false;
            MCFooter.MCSideB.MCSetAB.MCB._visible = true;
            if (Redraw != 1)
            {
                _root.ABmodePosition[1] = MCSeekBar.MCSeeker._x;
                MCSeekBar.MCABSeekMask._width = 1 + _root.ABmodePosition[1] - _root.ABModePosition[0];
                MCSeekBar.MCABSeekBG.setMask(MCSeekBar.MCABSeekMask);
            }
            else
            {
                MCSeekBar.MCABSeekMask._x = _root.ABModePosition[0];
                MCSeekBar.MCABSeekMask._width = 1 + _root.ABmodePosition[1] - _root.ABModePosition[0];
                MCSeekBar.MCABSeekBG.setMask(MCSeekBar.MCABSeekMask);
            } // end else if
            break;
        } 
    } // End of switch
} // End of the function
function fn_SetFileNumber()
{
    gCurrFileNum = ext_fscommand2("GetEtcCurPLIndex");
    gTotalFileNum = ext_fscommand2("GetEtcTotalPLNum");
    if (gPrevFileNum == -1)
    {
        gPrevFileNum = gCurrFileNum;
    } // end if
    gCurrFileNumREAL = gCurrFileNum + 1;
    MCFileNum.text = gCurrFileNumREAL + " / " + gTotalFileNum;
} // End of the function
function fn_SetPlayTime(updateAll)
{
    var _loc2 = 0;
    gCurPlayTime = ext_fscommand2("GetAudPlayTime");
    TXTimeCurVALUE = gfn_Common_GetTime2Text(gCurPlayTime);
    TXTimeCurTotal.text = TXTimeCurValue + " / " + TXTimeTotalVALUE;
    if (updateAll)
    {
        gTotalPlayTime = ext_fscommand2("GetAudTotalTime");
        TXTimeTotalVALUE = gfn_Common_GetTime2Text(gTotalPlayTime);
        TXTimeCurTotal.text = TXTimeCurValue + " / " + TXTimeTotalVALUE;
    } // end if
    if (_root.displayTime == 1)
    {
        gCurPlayTime = gTotalPlayTime - gCurPlayTime;
    } // end if
    _loc2 = gfn_Common_GetRatio(gTotalPlayTime, gCurPlayTime);
    fn_Common_DrawSeekBar(MCSeekBar.MCSeekBG, MCSeekBar.MCSeeker, MCSeekBar.MCSeekMask, _loc2, SCROLL_HORIZONTAL);
    if (g_PlayABRepeat == 1)
    {
        MCSeekBar.MCABSeekMask._width = 0 + MCSeekBar.MCSeekMask._width + MCSeekBar.MCSeekMask._x - MCSeekBar.MCABSeekMask._x;
        MCSeekBar.MCABSeekBG.setMask(MCSeekBar.MCABSeekMask);
    } // end if
} // End of the function
function fn_randomCoverA(i, fileIndex, num)
{
    if (i == "CC")
    {
        return;
    } // end if
    var _loc1;
    var _loc2 = random(7) + 1;
    if (ext_fscommand2("GetAudAlbumArtTotalNum", fileIndex) <= 0)
    {
        _loc1 = "./System/Flash UI/ASUCI1/cover" + _loc2 + ".jpg";
    }
    else
    {
        _loc1 = fileIndex + ".MUS";
    } // end else if
    now_AlbumArt = _loc1;
    switch (i)
    {
        case "C":
        {
            now_RefAlbumArt = _loc1;
            break;
        } 
        case "P":
        {
            now_RefAlbumArt_P = _loc1;
            break;
        } 
        case "F":
        {
            now_RefAlbumArt_F = _loc1;
            break;
        } 
        case "CP":
        {
            now_RefAlbumArt_F = now_RefAlbumArt;
            now_RefAlbumArt = now_RefAlbumArt_P;
            now_RefAlbumArt_P = _loc1;
            break;
        } 
        case "CF":
        {
            now_RefAlbumArt_P = now_RefAlbumArt;
            now_RefAlbumArt = now_RefAlbumArt_F;
            now_RefAlbumArt_F = _loc1;
            break;
        } 
    } // End of switch
} // End of the function
function fn_Music_Get_AlbumCover(fileIndex, num)
{
    var _loc3;
    var _loc4;
    if (_root.MCCon["gfloadedFlag" + num] == 0)
    {
        var _loc5;
        _root.MCCon.MCAlbum["MCAlbumBG" + num].MCFrame._visible = false;
        _root.MCCon.MCAlbum["MCAlbumBG" + num].MCCoverA._visible = false;
        _root.MCCon.MCAlbum["MCAlbumBG" + num].MCAlbumArt._visible = false;
        _root.MCCon.MCAlbum["MCAlbumBG" + num].MCCoverB._visible = false;
        _loc3 = now_AlbumArt;
        _root.MCCon["coverLoader" + num].unloadClip(_root.MCCon.MCAlbum["MCAlbumBG" + num].MCAlbumArt);
        _root.MCCon["coverLoader" + num].loadClip(_loc3, _root.MCCon.MCAlbum["MCAlbumBG" + num].MCAlbumArt);
        _root.MCCon["gfloadedFlag" + num] = 1;
        _root.MCCon["coverLoader" + num].addListener(_root.MCCon["coverListener" + num]);
    } // end if
} // End of the function
function fn_Music_Get_AlbumRef(fileIndex)
{
    var _loc2;
    var _loc3;
    if (_root.MCCon.gfloadedFlag3 == 0)
    {
        var _loc4;
        _root.MCCon.MCAlbumBG3.MCCoverA._visible = false;
        _root.MCCon.MCAlbumBG3.MCAlbumArt._visible = false;
        _root.MCCon.MCAlbumBG3.MCCoverB._visible = false;
        _loc2 = now_RefAlbumArt;
        _root.MCCon.coverLoader3.unloadClip(_root.MCCon.MCAlbumBG3.MCAlbumArt);
        _root.MCCon.coverLoader3.loadClip(_loc2, _root.MCCon.MCAlbumBG3.MCAlbumArt);
        _root.MCCon.gfloadedFlag3 = 1;
        _root.MCCon.coverLoader3.addListener(_root.MCCon.coverListener3);
        MCAlbumBG3._visible = true;
    } // end if
} // End of the function
function fn_DrawCurrState()
{
    _global.g_PlayMode = ext_fscommand2("GetEtcState");
    if (_global.g_PlayMode == _global.STATE_MUSIC_PLAY)
    {
        MCFooter.MCSideA.MCPause._visible = true;
        MCFooter.MCSideA.MCPlay._visible = false;
        MCInfobar.icon_task_pause._visible = false;
        MCInfobar.icon_task_play._visible = true;
    }
    else
    {
        MCFooter.MCSideA.MCPause._visible = false;
        MCFooter.MCSideA.MCPlay._visible = true;
        MCInfobar.icon_task_pause._visible = true;
        MCInfobar.icon_task_play._visible = false;
    } // end else if
} // End of the function
function fn_PrevAction_EQPopup(Numofloop)
{
    var i;
    var count = 0;
    curJetPresetIndex = curJetPresetIndex - Numofloop;
    if (curJetPresetIndex < 0)
    {
        curJetPresetIndex = _root.EQString.length - 1;
    } // end if
    fn_SetEQPopupString(curJetPresetIndex);
    for (i = 1; i <= 5; i++)
    {
        MCPopEqSet["MCEqString" + i]._y = _root.Origin_Y[i - 1];
        MCPopEqSet["MCEqString" + i]._height = _root.Origin_Height[i - 1];
    } // end of for
    MCPopEqSet.onEnterFrame = function ()
    {
        for (i = 1; i <= 5; i++)
        {
            MCPopEqSet["MCEqString" + i]._y = MCPopEqSet["MCEqString" + i]._y + (_root.Origin_Y[i] - MCPopEqSet["MCEqString" + i]._y) / 2;
            MCPopEqSet["MCEqString" + i]._height = MCPopEqSet["MCEqString" + i]._height + (44 - MCPopEqSet["MCEqString" + i]._height) / 2;
            if (_root.Origin_Y[i] - MCPopEqSet["MCEqString" + i]._y < 1 && 44 - MCPopEqSet["MCEqString" + i]._height < 1)
            {
                MCPopEqSet["MCEqString" + i]._y = _root.Origin_Y[i];
                MCPopEqSet["MCEqString" + i]._height = 44;
                ++count;
                if (count == 5)
                {
                    delete MCPopEqSet.onEnterFrame;
                } // end if
            } // end if
        } // end of for
    };
} // End of the function
function fn_NextAction_EQPopup(Numofloop)
{
    var i;
    var count = 0;
    curJetPresetIndex = curJetPresetIndex + Numofloop;
    if (curJetPresetIndex >= _root.EQString.length)
    {
        curJetPresetIndex = 0;
    } // end if
    fn_SetEQPopupString(curJetPresetIndex);
    for (i = 1; i <= 5; i++)
    {
        MCPopEqSet["MCEqString" + i]._y = _root.Origin_Y[i + 1];
        MCPopEqSet["MCEqString" + i]._height = _root.Origin_Height[i + 1];
    } // end of for
    MCPopEqSet.onEnterFrame = function ()
    {
        for (i = 1; i <= 5; i++)
        {
            MCPopEqSet["MCEqString" + i]._y = MCPopEqSet["MCEqString" + i]._y - (MCPopEqSet["MCEqString" + i]._y - _root.Origin_Y[i]) / 2;
            MCPopEqSet["MCEqString" + i]._height = MCPopEqSet["MCEqString" + i]._height - (MCPopEqSet["MCEqString" + i]._height - 44) / 2;
            if (MCPopEqSet["MCEqString" + i]._y - _root.Origin_Y[i] < 1 && MCPopEqSet["MCEqString" + i]._height - 44 < 1)
            {
                MCPopEqSet["MCEqString" + i]._y = Origion_Y[i];
                MCPopEqSet["MCEqString" + i]._height = 44;
                ++count;
                if (count == 5)
                {
                    delete MCPopEqSet.onEnterFrame;
                } // end if
            } // end if
        } // end of for
    };
} // End of the function
function fn_SetEQPopupString(curIndex)
{
    var _loc6;
    var _loc7;
    var _loc4;
    var _loc5;
    var _loc3 = _root.EQString.length;
    var _loc9 = MCFooter.MCSideA.MCPopEqSet;
    _loc7 = curIndex - 2;
    if (_loc7 < 0)
    {
        _loc7 = _loc3 + _loc7;
    } // end if
    _loc6 = curIndex - 1;
    if (_loc6 < 0)
    {
        _loc6 = _loc3 + _loc6;
    } // end if
    _loc4 = curIndex + 1;
    if (_loc4 >= _loc3)
    {
        _loc4 = _loc4 - _loc3;
    } // end if
    _loc5 = curIndex + 2;
    if (_loc5 >= _loc3)
    {
        _loc5 = _loc5 - _loc3;
    } // end if
    MCPopEqSet.MCEqString1.TXEqString.text = _root.EQString[_loc7];
    MCPopEqSet.MCEqString2.TXEqString.text = _root.EQString[_loc6];
    MCPopEqSet.MCEqString3.TXEqString.text = _root.EQString[curIndex];
    MCPopEqSet.MCEqString4.TXEqString.text = _root.EQString[_loc4];
    MCPopEqSet.MCEqString5.TXEqString.text = _root.EQString[_loc5];
    _global.gfn_Common_SetStringScroll(MCPopEqSet.MCEqString3.TXEqString, 1);
} // End of the function
function fn_SetTextScroll()
{
    _global.gfn_Common_SetStringScroll(MCPlayInfo.TXTitle, 1);
    _global.gfn_Common_SetStringScroll(MCPlayInfo.TXFileName, 1);
} // End of the function
function fn_SetLyricState()
{
    if (ext_fscommand2("GetAudLDBType") > 0)
    {
        Lyric_Icon._visible = true;
        Lyric_Touch2._visible = true;
    }
    else
    {
        Lyric_Icon._visible = false;
        Lyric_Touch2._visible = false;
    } // end else if
    if (ext_fscommand2("GetAudLDBType") > 0 && _global.gfn_GetPopupMCName() == null && ext_fscommand2("EtcUsrGetNumber", 0) == 0)
    {
        if (MCFooter.MCSideB._visible == true || MCArrow_Up._visible == true || MCArrow_Down._visible == true)
        {
            ext_fscommand2("SetAudLDBConfig", _root.ldbconfigOff);
            Lyric_Back._visible = false;
            Lyric_Icon._visible = true;
            Lyric_Touch2._visible = true;
        }
        else
        {
            ext_fscommand2("SetAudLDBConfig", _root.ldbconfigOn);
            Lyric_Back._visible = true;
            Lyric_Icon._visible = false;
            Lyric_Touch2._visible = false;
        } // end else if
    }
    else
    {
        MCPlayInfo._visible = true;
        ext_fscommand2("SetAudLDBConfig", _root.ldbconfigOff);
        Lyric_Back._visible = false;
        Lyric_Icon._visible = true;
        Lyric_Touch2._visible = true;
    } // end else if
    if (ext_fscommand2("GetAudLDBType") == 0)
    {
        Lyric_Icon._visible = false;
        Lyric_Touch2._visible = false;
    } // end if
} // End of the function
function fn_GetFileInfo(num)
{
    var _loc5 = ext_fscommand2("GetAudArtist", gCurrFileNum, "TXArtistTEXT");
    var _loc4 = ext_fscommand2("GetAudAlbum", gCurrFileNum, "TXAlbumTEXT");
    ext_fscommand2("GetAudTitle", gCurrFileNum, "MCPlayInfo.TXTitle.text");
    ext_fscommand2("GetEtcFileName", gCurrFileNum, "MCPlayInfo.TXFileName.text");
    if (_loc5 > -1 && _loc4 > -1)
    {
        MCPlayInfo.TXTag.text = TXArtistTEXT + "  |  " + TXAlbumTEXT;
    }
    else if (_loc5 > -1 && _loc4 <= -1)
    {
        MCPlayInfo.TXTag.text = TXArtistTEXT;
    }
    else if (_loc5 <= -1 && _loc4 > -1)
    {
        MCPlayInfo.TXTag.text = TXAlbumTEXT;
    }
    else
    {
        MCPlayInfo.TXTag.text = TXArtistTEXT + "  |  " + TXAlbumTEXT;
    } // end else if
    ext_fscommand2("GetAudCodec", "now_AudCodec");
    var _loc7 = String(ext_fscommand2("GetAudBitRate")) + " kbps";
    var _loc6 = String(ext_fscommand2("GetAudSampleRate")) + " kHz";
    MCPlayInfo.TXFileinfo.text = now_AudCodec + "  |  " + _loc7 + "  |  " + _loc6;
    fn_PlayInfo_Mode(SOL_ASUCI1_MUSIC.data.PlayInfo_Mode);
    fn_SetTextScroll();
    if (num == 0)
    {
        ext_fscommand2("GetAudCodec", "MCAlbum.MCAlbumBG0.MCCoverB.TXCodec.text");
    }
    else if (num == 1)
    {
        ext_fscommand2("GetAudCodec", "MCAlbum.MCAlbumBG1.MCCoverB.TXCodec.text");
    }
    else if (num == 2)
    {
        ext_fscommand2("GetAudCodec", "MCAlbum.MCAlbumBG2.MCCoverB.TXCodec.text");
    } // end else if
    _root.MCCon.MCAlbum["MCAlbumBG" + num].MCCoverB.TXBitRate.text = String(ext_fscommand2("GetAudBitRate")) + " kbps";
    _root.MCCon.MCAlbum["MCAlbumBG" + num].MCCoverB.TXSamplingRate.text = String(ext_fscommand2("GetAudSampleRate")) + " kHz";
    _root.MCCon.MCAlbum["MCAlbumBG" + num].MCCoverB.TXCurJetPreset.text = _root.EQString[ext_fscommand2("GetJetEffectIndex")];
    _global.gfn_Common_SetStringScroll(_root.MCCon.MCAlbum["MCAlbumBG" + num].MCCoverB.TXCurJetPreset, 1);
    _root.MCCon.MCPlayMode.TXCurEq.text = _root.EQString_icon[ext_fscommand2("GetJetEffectIndex")];
} // End of the function
function fn_Reflush_AllDisplay()
{
    var _loc5 = MCPopMsg.TXMsg.text;
    var _loc4;
    fn_SetPlayTime(1);
    fn_SetFileNumber();
    MCSeekBar.MCSeeker.onRelease();
    if (gTotalFileNum >= 0 && gCurrFileNum >= 0)
    {
        if (gPrevFileNum != gCurrFileNum)
        {
            var speed;
            var mov_pix = 0;
            var temp;
            var num;
            MCAlbumBG3._visible = false;
            if (_root.MovingFlag != 0)
            {
                if (_root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_C]._x < 0)
                {
                    _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_C]._x = -272;
                    _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_F]._x = 0;
                    delete MCAlbum.onEnterFrame;
                    temp = _root.Album_P;
                    _root.Album_P = _root.Album_C;
                    _root.Album_C = _root.Album_F;
                    _root.Album_F = temp;
                    _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_P]._x = -600;
                    _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_F]._x = 600;
                    num = gCurrFileNum;
                    if (num == gTotalFileNum)
                    {
                        num = 0;
                    } // end if
                    fn_randomCoverA("CF", num, _root.Album_F);
                    fn_Music_Get_AlbumCover(num, _root.Album_F);
                    _root.MovingFlag = 0;
                } // end if
                if (_root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_C]._x > 0)
                {
                    _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_C]._x = 272;
                    _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_P]._x = 0;
                    delete MCAlbum.onEnterFrame;
                    temp = _root.Album_F;
                    _root.Album_F = _root.Album_C;
                    _root.Album_C = _root.Album_P;
                    _root.Album_P = temp;
                    _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_P]._x = -600;
                    _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_F]._x = 600;
                    num = gCurrFileNum;
                    if (num == -1)
                    {
                        num = gTotalFileNum - 1;
                    } // end if
                    fn_randomCoverA("CP", num, _root.Album_P);
                    fn_Music_Get_AlbumCover(num, _root.Album_P);
                    _root.MovingFlag = 0;
                } // end if
            } // end if
            if (_root.LightOn == 1)
            {
                fn_randomCoverA("C", gCurrFileNum, _root.Album_C);
                fn_Music_Get_AlbumCover(gCurrFileNum, _root.Album_C);
                fn_Music_Get_AlbumRef(gCurrFileNum);
                var num = gCurrFileNum - 1;
                if (num == -1)
                {
                    num = gTotalFileNum - 1;
                } // end if
                fn_randomCoverA("P", num, _root.Album_P);
                fn_Music_Get_AlbumCover(num, _root.Album_P);
                num = gCurrFileNum + 1;
                if (num == gTotalFileNum)
                {
                    num = 0;
                } // end if
                fn_randomCoverA("F", num, _root.Album_F);
                fn_Music_Get_AlbumCover(num, _root.Album_F);
            }
            else if (gPrevFileNum + 1 == gCurrFileNum || gPrevFileNum == gTotalFileNum - 1 && gCurrFileNum == 0)
            {
                _root.MovingFlag = 1;
                _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_F]._x = 272;
                if (_root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_F].MCCoverB._visible == true)
                {
                    if (this["gfCoverExist" + _root.Album_F] != 1)
                    {
                        _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_F].MCCoverA._visible = true;
                    } // end if
                    _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_F].MCAlbumArt._visible = true;
                    _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_F].MCCoverB._visible = false;
                } // end if
                if (ext_fscommand2("GetAudShuffle") == 1 && gPrevFileNum == gTotalFileNum - 1)
                {
                    fn_randomCoverA("CF", gCurrFileNum, _root.Album_F);
                    fn_Music_Get_AlbumCover(gCurrFileNum, _root.Album_F);
                } // end if
                MCAlbum.onEnterFrame = function ()
                {
                    if (mov_pix < 272)
                    {
                        speed = 7.000000E-001 * (272 - mov_pix);
                        if (speed < 5)
                        {
                            speed = 272 - mov_pix;
                        } // end if
                        _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_C]._x = _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_C]._x - speed;
                        _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_F]._x = _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_F]._x - speed;
                        mov_pix = mov_pix + speed;
                    }
                    else
                    {
                        delete MCAlbum.onEnterFrame;
                        temp = _root.Album_P;
                        _root.Album_P = _root.Album_C;
                        _root.Album_C = _root.Album_F;
                        _root.Album_F = temp;
                        _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_P]._x = -600;
                        _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_F]._x = 600;
                        num = gCurrFileNum + 1;
                        if (num == gTotalFileNum)
                        {
                            num = 0;
                        } // end if
                        fn_randomCoverA("CF", num, _root.Album_F);
                        fn_Music_Get_AlbumCover(num, _root.Album_F);
                        _root.MovingFlag = 0;
                        fn_Music_Get_AlbumRef(gCurrFileNum);
                    } // end else if
                };
            }
            else if (gPrevFileNum - 1 == gCurrFileNum || gPrevFileNum == 0 && gCurrFileNum == gTotalFileNum - 1)
            {
                _root.MovingFlag = 1;
                _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_P]._x = -272;
                if (_root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_P].MCCoverB._visible == true)
                {
                    if (this["gfCoverExist" + _root.Album_P] != 1)
                    {
                        _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_P].MCCoverA._visible = true;
                    } // end if
                    _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_P].MCAlbumArt._visible = true;
                    _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_P].MCCoverB._visible = false;
                } // end if
                if (ext_fscommand2("GetAudShuffle") == 1 && gPrevFileNum == 0)
                {
                    fn_randomCoverA("CP", gCurrFileNum, _root.Album_P);
                    fn_Music_Get_AlbumCover(gCurrFileNum, _root.Album_P);
                } // end if
                MCAlbum.onEnterFrame = function ()
                {
                    if (mov_pix < 272)
                    {
                        speed = 7.000000E-001 * (272 - mov_pix);
                        if (speed < 5)
                        {
                            speed = 272 - mov_pix;
                        } // end if
                        _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_P]._x = _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_P]._x + speed;
                        _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_C]._x = _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_C]._x + speed;
                        mov_pix = mov_pix + speed;
                    }
                    else
                    {
                        delete MCAlbum.onEnterFrame;
                        temp = _root.Album_F;
                        _root.Album_F = _root.Album_C;
                        _root.Album_C = _root.Album_P;
                        _root.Album_P = temp;
                        _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_P]._x = -600;
                        _root.MCCon.MCAlbum["MCAlbumBG" + _root.Album_F]._x = 600;
                        num = gCurrFileNum - 1;
                        if (num == -1)
                        {
                            num = gTotalFileNum - 1;
                        } // end if
                        fn_randomCoverA("CP", num, _root.Album_P);
                        fn_Music_Get_AlbumCover(num, _root.Album_P);
                        _root.MovingFlag = 0;
                        fn_Music_Get_AlbumRef(gCurrFileNum);
                    } // end else if
                };
            } // end else if
            gPrevFileNum = gCurrFileNum;
        } // end if
        _loc4 = ext_fscommand2("GetEtcOpenState", "MCPopMsg.TXMsg.text");
        if (_loc4 == 0)
        {
            MCPopMsg.TXMsg.text = _loc5;
            fn_GetFileInfo(_root.Album_C);
            fn_SetLyricState();
        }
        else if (_loc4 >= 100)
        {
            MCPopDRM.TXTitle.text = MCPopMsg.TXMsg.text;
            _global.gfn_SetPopupMCName(MCPopDRM, 0);
            fn_SetLyricState();
        }
        else
        {
            _global.gfn_SetPopupMCName(MCPopMsg, 1);
            fn_SetLyricState();
        } // end else if
        g_PlayABRepeat = ext_fscommand2("GetAudABMode");
        fn_SetABRepeat(g_PlayABRepeat, 1);
    }
    else
    {
        fn_GetFileInfo(_root.Album_C);
    } // end else if
    fn_DrawCurrState();
} // End of the function
function fn_Music_QuickList_Next(NumofLoop)
{
    var GetDegree;
    if (aniflag == 0)
    {
        if (gTotalFileNum <= NumofLoop)
        {
            gQuickCurrFileNum = gCurrFileNum;
        }
        else if (gQuickCurrFileNum + NumofLoop >= gTotalFileNum)
        {
            gQuickCurrFileNum = gQuickCurrFileNum + NumofLoop - gTotalFileNum;
        }
        else
        {
            gQuickCurrFileNum = gQuickCurrFileNum + NumofLoop;
        } // end else if
        fn_Music_Get_QuickList_AlbumCover(gQuickCurrFileNum);
        MCQuickList.MCbox._x = MCQuickList.MCQLTouch2._x;
        gQuickSelectNum = 2;
        for (i = 1; i < 4; i++)
        {
            MCQuickList["MCQuickBG" + i].lp = i * 62 - 15;
            MCQuickList["MCQuickBG" + i]._x = i * 62 - 15 + 61;
            MCQuickList["MCQuickBG" + i].onEnterFrame = function ()
            {
                if (gfQuickListCover == 0)
                {
                    aniflag = 1;
                    GetDegree = Math.floor((this.lp - this._x) * 5.000000E-001);
                    this._x = this._x + GetDegree;
                    if (GetDegree >= 0)
                    {
                        MCQuickList.MCBox._visible = true;
                        delete this.onEnterFrame;
                        aniflag = 0;
                    } // end if
                } // end if
            };
        } // end of for
    } // end if
} // End of the function
function fn_Music_QuickList_Prev(NumofLoop)
{
    var GetDegree;
    if (aniflag == 0)
    {
        if (gTotalFileNum <= NumofLoop)
        {
            gQuickCurrFileNum = gCurrFileNum;
        }
        else if (gQuickCurrFileNum - NumofLoop < 0)
        {
            gQuickCurrFileNum = gQuickCurrFileNum - NumofLoop + gTotalFileNum;
        }
        else
        {
            gQuickCurrFileNum = gQuickCurrFileNum - NumofLoop;
        } // end else if
        fn_Music_Get_QuickList_AlbumCover(gQuickCurrFileNum);
        MCQuickList.MCbox._x = MCQuickList.MCQLTouch2._x;
        gQuickSelectNum = 2;
        for (i = 1; i < 4; i++)
        {
            MCQuickList["MCQuickBG" + i].lp = i * 62 - 15;
            MCQuickList["MCQuickBG" + i]._x = i * 62 - 15 - 61;
            MCQuickList["MCQuickBG" + i].onEnterFrame = function ()
            {
                if (gfQuickListCover == 0)
                {
                    aniflag = 1;
                    GetDegree = Math.ceil((this.lp - this._x) * 5.000000E-001);
                    this._x = this._x + GetDegree;
                    if (GetDegree <= 0)
                    {
                        MCQuickList.MCBox._visible = true;
                        delete this.onEnterFrame;
                        aniflag = 0;
                    } // end if
                } // end if
            };
        } // end of for
    } // end if
} // End of the function
function fn_Destroy_Fr1()
{
    delete coverLoader0;
    delete coverListener0;
    delete coverLoader1;
    delete coverListener1;
    delete coverLoader2;
    delete coverListener2;
    delete coverLoader3;
    delete coverListener3;
    delete QuickcoverLoader1;
    delete QuickcoverLoader2;
    delete QuickcoverLoader3;
    delete QuickcoverListener1;
    delete QuickcoverListener2;
    delete QuickcoverListener3;
} // End of the function
function fn_forceOff_Lyrics()
{
    if (ext_fscommand2("GetAudLDBType") > 0 && _global.gfn_GetPopupMCName() != "MCPopEqSet")
    {
        if (ext_fscommand2("EtcUsrGetNumber", 0) == 0)
        {
            ext_fscommand2("EtcUsrSetNumber", 0, 1);
            Lyrics_forceOff = true;
        } // end if
    } // end if
    fn_SetLyricState();
} // End of the function
ext_fscommand2("SetAudAlbumArtMCSize", "272");
ext_fscommand2("SetAudAlbumBMCSize", "272");
eff_ShowHide_Delay = function (delay, show, hide)
{
    hide._visible = true;
    var _loc1 = function ()
    {
        if (i == delay)
        {
            show.gotoAndStop(1);
            show._visible = true;
            hide._visible = false;
            clearInterval(fn_loop_Int);
        }
        else
        {
            i = i + 1000;
        } // end else if
    };
    var i = delay;
    var fn_loop_Int = setInterval(_loc1, delay);
};
eff_FadeIn = function (step, g, target)
{
    target._visible = true;
    target.onEnterFrame = function ()
    {
        step = step * g;
        this._alpha = this._alpha + step;
        trace ("FadeIn =" + this._alpha);
        if (this._alpha >= 100)
        {
            this._alpha = 100;
            trace ("бу fn_FadeIn : [ DONE ]");
            delete this.onEnterFrame;
        } // end if
    };
};
eff_FadeOut = function (step, g, target)
{
    target.onEnterFrame = function ()
    {
        step = step * g;
        this._alpha = this._alpha - step;
        trace ("FadeOut =" + this._alpha);
        if (this._alpha <= 0)
        {
            this._alpha = 0;
            target._visible = false;
            trace ("бу fn_FadeOut : [ DONE ]");
            delete this.onEnterFrame;
        } // end if
    };
};
eff_Move = function (target, g)
{
    target._visible = true;
    var speed;
    target.onEnterFrame = function ()
    {
        if (MCFooter.MCSideB._y < -278)
        {
            speed = 7.500000E-001 * (50 - mov_pix);
            if (speed < 7.500000E+000)
            {
                speed = 50 - mov_pix;
            } // end if
            MCFooter.MCSideB._y = MCFooter.MCSideB._y + speed;
            mov_pix = mov_pix + speed;
        }
        else
        {
            MCFooter.MCSideB._y = -278;
            delete target.onEnterFrame;
        } // end else if
    };
};
fn_TXTime_poschange = function ()
{
    var _loc1 = ext_fscommand2("GetTim24HDisplay");
    if (_loc1)
    {
        MCInfobar.TXAmPm._visible = false;
        MCInfobar.TXTime._x = 120;
    }
    else
    {
        MCInfobar.TXAmPm._visible = true;
        MCInfobar.TXTime._x = 111;
    } // end else if
};
fn_Common_DrawSeekBar = function (BGMC, TargetMC, MaskMC, Position, ScrollMode)
{
    if (Position < 0)
    {
        Position = 0;
    } // end if
    if (Position > 100)
    {
        Position = 100;
    } // end if
    if (ScrollMode == SCROLL_HORIZONTAL)
    {
        if (MaskMC == null)
        {
            var _loc2 = BGMC._width;
        }
        else
        {
            _loc2 = BGMC._width;
        } // end else if
        TargetMC._x = Position * _loc2 / 100;
        gfn_Common_SetMask(Math.floor(TargetMC._x) + 1, BGMC._height, BGMC, MaskMC);
    }
    else if (ScrollMode == SCROLL_VERTICAL)
    {
        if (MaskMC == null)
        {
            _loc2 = BGMC._height;
        }
        else
        {
            _loc2 = BGMC._height;
        } // end else if
        TargetMC._y = Position * _loc2 / 100;
        gfn_Common_SetMask(Math.floor(TargetMC._y) + 1, BGMC._width, BGMC, MaskMC);
    } // end else if
};
fn_MCSideB_ONPanal_OffAll = function ()
{
    MCFooter.MCSideB.MCSetBoundaryON._visible = false;
    MCFooter.MCSideB.MCSetEQON._visible = false;
    MCFooter.MCSideB.MCSetSpeedON._visible = false;
    MCFooter.MCSideB.MCSetFavorite._visible = true;
    MCFooter.MCSideB.MCSetBookmark._visible = true;
    MCFooter.MCSideB.MCGoSettings._visible = true;
};
var now_AlbumArt = "./System/Flash UI/ASUCI1/cover1.jpg";
var now_RefAlbumArt = "./System/Flash UI/ASUCI1/cover1.jpg";
var now_RefAlbumArt_P = "./System/Flash UI/ASUCI1/cover1.jpg";
var now_RefAlbumArt_F = "./System/Flash UI/ASUCI1/cover1.jpg";
var SOL_ASUCI1_MUSIC = SharedObject.getLocal("ASUCI1_MUSIC");
if (SOL_ASUCI1_MUSIC.data.PlayInfo_Mode == null)
{
    SOL_ASUCI1_MUSIC.data.PlayInfo_Mode = "tag";
} // end if
fn_PlayInfo_Mode = function (now_mode)
{
    if (MCPlayInfo.TXTitle.text == "Unknown" && TXArtistTEXT == "Unknown" && TXAlbumTEXT == "Unknown")
    {
        MCPlayInfo.TXTitle._visible = false;
        MCPlayInfo.TXTag._visible = false;
        MCPlayInfo.TXFilename._visible = true;
        if (now_AudCodec == "NONE")
        {
            MCPlayInfo.TXFileinfo._visible = false;
        }
        else
        {
            MCPlayInfo.TXFileinfo._visible = true;
        } // end else if
    }
    else if (now_mode == "filename")
    {
        if (SOL_ASUCI1_MUSIC.data.PlayInfo_Mode !== now_mode)
        {
            SOL_ASUCI1_MUSIC.data.PlayInfo_Mode = "filename";
            SOL_ASUCI1_MUSIC.flush();
        } // end if
        MCPlayInfo.TXTitle._visible = false;
        MCPlayInfo.TXTag._visible = false;
        MCPlayInfo.TXFilename._visible = true;
        if (now_AudCodec == "NONE")
        {
            MCPlayInfo.TXFileinfo._visible = false;
        }
        else
        {
            MCPlayInfo.TXFileinfo._visible = true;
        } // end else if
    }
    else
    {
        if (SOL_ASUCI1_MUSIC.data.PlayInfo_Mode !== now_mode)
        {
            SOL_ASUCI1_MUSIC.data.PlayInfo_Mode = "tag";
            SOL_ASUCI1_MUSIC.flush();
        } // end if
        MCPlayInfo.TXTitle._visible = true;
        MCPlayInfo.TXTag._visible = true;
        MCPlayInfo.TXFilename._visible = false;
        MCPlayInfo.TXFileinfo._visible = false;
    } // end else if
};
var gTotalPlayTime;
var gCurPlayTime;
var gPrevFileNum = -1;
var gPrevQLNum = -1;
var gCurrFileNum;
var gTotalFileNum;
var gQuickCurrFileNum;
var gQuickSelectNum;
var gAlbumWidth;
var gAlbumHeight;
var gfloadedFlag0 = 0;
var gfloadedFlag1 = 0;
var gfloadedFlag2 = 0;
var gfloadedFlag3 = 0;
var gfCoverExist0 = 0;
var gfCoverExist1 = 0;
var gfCoverExist2 = 0;
var gfCoverExist3 = 0;
var gfQuickListCover = 0;
var aniflag = 0;
var coverLoader0 = new MovieClipLoader();
var coverListener0 = new Object();
var coverLoader1 = new MovieClipLoader();
var coverListener1 = new Object();
var coverLoader2 = new MovieClipLoader();
var coverListener2 = new Object();
var coverLoader3 = new MovieClipLoader();
var coverListener3 = new Object();
var QuickcoverLoader1 = new MovieClipLoader();
var QuickcoverListener1 = new Object();
var QuickcoverLoader2 = new MovieClipLoader();
var QuickcoverListener2 = new Object();
var QuickcoverLoader3 = new MovieClipLoader();
var QuickcoverListener3 = new Object();
var curJetPresetIndex;
coverListener0.onLoadInit = function (mc)
{
    var _loc2;
    mc._xscale = 100;
    mc._yscale = 100;
    _loc2 = mc._width / mc._height;
    if (_loc2 > 1)
    {
        _loc2 = mc._height / mc._width;
        mc._width = gAlbumWidth;
        mc._height = gAlbumHeight * _loc2;
        mc._x = 0;
        mc._y = (gAlbumHeight - mc._height) / 2;
    }
    else
    {
        mc._width = gAlbumWidth * _loc2;
        mc._height = gAlbumHeight;
        mc._x = (gAlbumWidth - mc._width) / 2;
        mc._y = 0;
    } // end else if
    if (gfloadedFlag0 == 1)
    {
        gfCoverExist0 = 1;
        gfloadedFlag0 = 0;
        retval = coverLoader0.removeListener(coverListener0);
    } // end if
};
coverListener0.onLoadError = function (mc, errorCode)
{
    if (gfloadedFlag0 == 1)
    {
        MCAlbum.MCAlbumBG0.MCFrame._visible = true;
        MCAlbum.MCAlbumBG0.MCCoverA._visible = true;
        gfCoverExist0 = 0;
        gfloadedFlag0 = 0;
        retval = coverLoader0.removeListener(coverListener0);
        MCAlbum.MCAlbumBG0.MCAlbumArt._visible = false;
    } // end if
};
coverListener1.onLoadInit = function (mc)
{
    var _loc2;
    mc._xscale = 100;
    mc._yscale = 100;
    _loc2 = mc._width / mc._height;
    if (_loc2 > 1)
    {
        _loc2 = mc._height / mc._width;
        mc._width = gAlbumWidth;
        mc._height = gAlbumHeight * _loc2;
        mc._x = 0;
        mc._y = (gAlbumHeight - mc._height) / 2;
    }
    else
    {
        mc._width = gAlbumWidth * _loc2;
        mc._height = gAlbumHeight;
        mc._x = (gAlbumWidth - mc._width) / 2;
        mc._y = 0;
    } // end else if
    if (gfloadedFlag1 == 1)
    {
        gfCoverExist1 = 1;
        gfloadedFlag1 = 0;
        retval = coverLoader1.removeListener(coverListener1);
    } // end if
};
coverListener1.onLoadError = function (mc, errorCode)
{
    if (gfloadedFlag1 == 1)
    {
        MCAlbum.MCAlbumBG1.MCFrame._visible = true;
        MCAlbum.MCAlbumBG1.MCCoverA._visible = true;
        gfCoverExist1 = 0;
        gfloadedFlag1 = 0;
        retval = coverLoader1.removeListener(coverListener1);
        MCAlbum.MCAlbumBG1.MCAlbumArt._visible = false;
    } // end if
};
coverListener2.onLoadInit = function (mc)
{
    var _loc2;
    mc._xscale = 100;
    mc._yscale = 100;
    _loc2 = mc._width / mc._height;
    if (_loc2 > 1)
    {
        _loc2 = mc._height / mc._width;
        mc._width = gAlbumWidth;
        mc._height = gAlbumHeight * _loc2;
        mc._x = 0;
        mc._y = (gAlbumHeight - mc._height) / 2;
    }
    else
    {
        mc._width = gAlbumWidth * _loc2;
        mc._height = gAlbumHeight;
        mc._x = (gAlbumWidth - mc._width) / 2;
        mc._y = 0;
    } // end else if
    if (gfloadedFlag2 == 1)
    {
        gfCoverExist2 = 1;
        gfloadedFlag2 = 0;
        retval = coverLoader2.removeListener(coverListener2);
    } // end if
};
coverListener2.onLoadError = function (mc, errorCode)
{
    if (gfloadedFlag2 == 1)
    {
        MCAlbum.MCAlbumBG2.MCFrame._visible = true;
        MCAlbum.MCAlbumBG2.MCCoverA._visible = true;
        gfCoverExist2 = 0;
        gfloadedFlag2 = 0;
        retval = coverLoader2.removeListener(coverListener2);
        MCAlbum.MCAlbumBG2.MCAlbumArt._visible = false;
    } // end if
};
coverListener3.onLoadInit = function (mc)
{
    var _loc2;
    mc._xscale = 100;
    mc._yscale = 100;
    _loc2 = mc._width / mc._height;
    if (_loc2 > 1)
    {
        _loc2 = mc._height / mc._width;
        mc._width = gAlbumWidth;
        mc._height = gAlbumHeight * _loc2;
        mc._x = 0;
        mc._y = (gAlbumHeight - mc._height) / 2;
    }
    else
    {
        mc._width = gAlbumWidth * _loc2;
        mc._height = gAlbumHeight;
        mc._x = (gAlbumWidth - mc._width) / 2;
        mc._y = 0;
    } // end else if
    if (gfloadedFlag3 == 1)
    {
        gfCoverExist3 = 1;
        gfloadedFlag3 = 0;
        retval = coverLoader3.removeListener(coverListener3);
    } // end if
};
coverListener3.onLoadError = function (mc, errorCode)
{
    if (gfloadedFlag3 == 1)
    {
        MCAlbumBG3.MCFrame._visible = false;
        MCAlbumBG3.MCCoverA._visible = true;
        gfCoverExist3 = 0;
        gfloadedFlag3 = 0;
        retval = coverLoader3.removeListener(coverListener3);
        MCAlbumBG3.MCAlbumArt._visible = false;
    } // end if
};
QuickcoverListener1.onLoadInit = function (mc)
{
    var _loc2;
    --gfQuickListCover;
    mc._xscale = 100;
    mc._yscale = 100;
    _loc2 = mc._width / mc._height;
    if (_loc2 > 1)
    {
        _loc2 = mc._height / mc._width;
        mc._width = 54;
        mc._height = 54 * _loc2;
        mc._x = 0;
        mc._y = (54 - mc._height) / 2;
    }
    else
    {
        mc._width = 54 * _loc2;
        mc._height = 54;
        mc._x = (54 - mc._width) / 2;
        mc._y = 0;
    } // end else if
    MCQuickList.MCQuickBG1.MCFrame._visible = true;
    retval = QuickcoverLoader1.removeListener(QuickcoverListener1);
};
QuickcoverListener1.onLoadError = function (mc, errorCode)
{
    var _loc1;
    --gfQuickListCover;
    MCQuickList.MCQuickBG1.MCFrame._visible = true;
    MCQuickList.MCQuickBG1.MCCoverBG._visible = true;
    _loc1 = QuickcoverLoader1.removeListener(QuickcoverListener1);
};
QuickcoverListener2.onLoadInit = function (mc)
{
    var _loc2;
    --gfQuickListCover;
    mc._xscale = 100;
    mc._yscale = 100;
    _loc2 = mc._width / mc._height;
    if (_loc2 > 1)
    {
        _loc2 = mc._height / mc._width;
        mc._width = 54;
        mc._height = 54 * _loc2;
        mc._x = 0;
        mc._y = (54 - mc._height) / 2;
    }
    else
    {
        mc._width = 54 * _loc2;
        mc._height = 54;
        mc._x = (54 - mc._width) / 2;
        mc._y = 0;
    } // end else if
    MCQuickList.MCQuickBG2.MCFrame._visible = true;
    retval = QuickcoverLoader2.removeListener(QuickcoverListener2);
};
QuickcoverListener2.onLoadError = function (mc, errorCode)
{
    var _loc1;
    --gfQuickListCover;
    MCQuickList.MCQuickBG2.MCFrame._visible = true;
    MCQuickList.MCQuickBG2.MCCoverBG._visible = true;
    _loc1 = QuickcoverLoader2.removeListener(QuickcoverListener2);
};
QuickcoverListener3.onLoadInit = function (mc)
{
    var _loc2;
    --gfQuickListCover;
    mc._xscale = 100;
    mc._yscale = 100;
    _loc2 = mc._width / mc._height;
    if (_loc2 > 1)
    {
        _loc2 = mc._height / mc._width;
        mc._width = 54;
        mc._height = 54 * _loc2;
        mc._x = 0;
        mc._y = (54 - mc._height) / 2;
    }
    else
    {
        mc._width = 54 * _loc2;
        mc._height = 54;
        mc._x = (54 - mc._width) / 2;
        mc._y = 0;
    } // end else if
    MCQuickList.MCQuickBG3.MCFrame._visible = true;
    retval = QuickcoverLoader3.removeListener(QuickcoverListener3);
};
QuickcoverListener3.onLoadError = function (mc, errorCode)
{
    var _loc1;
    --gfQuickListCover;
    MCQuickList.MCQuickBG3.MCFrame._visible = true;
    MCQuickList.MCQuickBG3.MCCoverBG._visible = true;
    _loc1 = QuickcoverLoader3.removeListener(QuickcoverListener3);
};
var AlbumTouchGapX;
var AlbumTouchGapY;
fn_initMusic();
MCSeekBar.MCSeeker.onPress = function ()
{
    if (_global.g_PlayMode == _global.STATE_MUSIC_PLAY && _global.gfn_GetPopupMCName() == null)
    {
        var ownX = this._x;
        var _loc5 = this._y;
        var tx = this._parent._xmouse;
        var ty = this._parent._ymouse;
        MCSeekBar.MCABSeekBG._alpha = 40;
        MCSeekBar.MCSeekBG._alpha = 40;
        MCSeekBar.MCSeeker.onMouseMove = function ()
        {
            var _loc2;
            moveX = this._parent._xmouse - tx;
            moveY = this._parent._ymouse - ty;
            maskWidth = gfn_Common_GetSeekBarRatio(MCSeekBar.MCSeekBG._width, 0, ownX + moveX);
            _loc2 = ext_fscommand2("GetAudPlayTime");
            if (_loc2 != Math.floor(gTotalPlayTime * maskWidth / 100))
            {
                var _loc3;
                _loc3 = ext_fscommand2("KeyAudDirectSeek", Math.floor(gTotalPlayTime * maskWidth / 100));
                if (_loc3 != -1)
                {
                    fn_Common_DrawSeekBar(MCSeekBar.MCSeekBG, this, MCSeekBar.MCSeekMask, maskWidth, SCROLL_HORIZONTAL);
                } // end if
            } // end if
            g_PlayABRepeat = ext_fscommand2("GetAudABMode");
            fn_SetABRepeat(g_PlayABRepeat, 1);
        };
    } // end if
};
MCSeekBar.MCSeeker.onRelease = MCSeekBar.MCSeeker.onReleaseOutside = function ()
{
    if (_global.g_PlayMode == _global.STATE_MUSIC_PLAY && _global.gfn_GetPopupMCName() == null)
    {
        delete this.onMouseMove;
        MCSeekBar.MCABSeekBG._alpha = 100;
        MCSeekBar.MCSeekBG._alpha = 100;
    } // end if
};
MCSeekBar.MCSeekTouch.onRelease = function ()
{
    if (_global.g_PlayMode == _global.STATE_MUSIC_PLAY && _global.gfn_GetPopupMCName() == null)
    {
        var _loc6 = this._xmouse;
        var _loc3;
        var _loc4;
        _loc3 = gfn_Common_GetSeekBarRatio(MCSeekBar.MCSeekBG._width, 0, _loc6);
        _loc4 = ext_fscommand2("GetAudPlayTime");
        if (_loc4 != Math.floor(gTotalPlayTime * _loc3 / 100))
        {
            var _loc5;
            _loc5 = ext_fscommand2("KeyAudDirectSeek", Math.floor(gTotalPlayTime * _loc3 / 100));
            if (_loc5 != -1)
            {
                fn_Common_DrawSeekBar(MCSeekBar.MCSeekBG, MCSeekBar.MCSeeker, MCSeekBar.MCSeekMask, _loc3, SCROLL_HORIZONTAL);
            } // end if
            g_PlayABRepeat = ext_fscommand2("GetAudABMode");
            fn_SetABRepeat(g_PlayABRepeat, 1);
        } // end if
    } // end if
};
MCFooter.MCSideA.MCPlay.onPress = MCFooter.MCSideA.MCPause.onPress = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(2);
    } // end if
};
MCFooter.MCSideA.MCPlay.onDragOut = MCFooter.MCSideA.MCPause.onDragOut = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(1);
    } // end if
};
MCFooter.MCSideA.MCPlay.onRelease = MCFooter.MCSideA.MCPause.onRelease = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        var _loc3;
        this.gotoAndStop(1);
        if (_global.g_PlayMode == STATE_MUSIC_PAUSE || _global.g_PlayMode == STATE_MUSIC_STOP)
        {
            ext_fscommand2("KeyAudPlay");
        }
        else
        {
            ext_fscommand2("KeyAudPause");
        } // end else if
        fn_DrawCurrState();
        fn_SetPlayTime(1);
    } // end if
};
MCFooter.MCSideA.MCREW.onPress = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        gfn_KeyRepeatOn(TOUCH_REW);
        this.gotoAndStop(2);
    } // end if
};
MCFooter.MCSideA.MCREW.onDragOut = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(1);
    } // end if
};
MCFooter.MCSideA.MCREW.onRelease = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        if (gfn_Key_GetLongkeyState() == false)
        {
            _root.fn_InputKeyHandler(TOUCH_REW);
        } // end if
        gfn_KeyRepeatOff();
        this.gotoAndStop(1);
    } // end if
};
MCFooter.MCSideA.MCFF.onPress = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        gfn_KeyRepeatOn(TOUCH_FF);
        this.gotoAndStop(2);
    } // end if
};
MCFooter.MCSideA.MCFF.onDragOut = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(1);
    } // end if
};
MCFooter.MCSideA.MCFF.onRelease = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        if (gfn_Key_GetLongkeyState() == false)
        {
            _root.fn_InputKeyHandler(TOUCH_FF);
        } // end if
        gfn_KeyRepeatOff();
        this.gotoAndStop(1);
    } // end if
};
MCFooter.MCSideB.MCAddList.onPress = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(2);
    } // end if
};
MCFooter.MCSideB.MCAddList.onDragOut = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(1);
    } // end if
};
MCFooter.MCSideB.MCAddList.onRelease = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        _global.gfn_SetPopupMCName(MCPopAdd, 1);
        fn_SetLyricState();
        if (MCQuickList.MCQuickButton.sw == 2)
        {
            MCQuickList.MCQuickButton.onRelease();
        } // end if
        this.gotoAndStop(1);
    } // end if
};
MCFooter.MCSideB.MCSetBt.MCBtOn.onPress = MCFooter.MCSideB.MCSetBt.MCBtOff.onPress = MCFooter.MCSideB.MCSetBookmark.MCBookmark.onPress = MCFooter.MCSideB.MCSetFavorite.MCFavorite.onPress = function ()
{
    this.gotoAndStop(2);
};
MCFooter.MCSideB.MCSetBt.MCBtOn.onDragOut = MCFooter.MCSideB.MCSetBt.MCBtOff.onDragOut = MCFooter.MCSideB.MCSetBookmark.MCBookmark.onDragOut = MCFooter.MCSideB.MCSetFavorite.MCFavorite.onDragOut = function ()
{
    this.gotoAndStop(1);
};
MCPopResult.onRelease = function ()
{
    _global.gfn_SetPopupMCName(null, 0);
    fn_SetLyricState();
};
MCFooter.MCSideB.MCSetBookmark.MCFailure._visible = false;
MCFooter.MCSideB.MCSetBookmark.MCSuccess._visible = false;
MCFooter.MCSideB.MCSetBookmark.MCBookmark.onRelease = function ()
{
    var _loc2;
    this.gotoAndStop(1);
    _loc2 = ext_fscommand2("KeyAudBookmark");
    if (_loc2 < 0)
    {
        MCFooter.MCSideB.MCSetBookmark.MCBookmark._visible = false;
        eff_ShowHide_Delay(2000, MCFooter.MCSideB.MCSetBookmark.MCBookmark, MCFooter.MCSideB.MCSetBookmarkMCFailure);
    }
    else
    {
        MCFooter.MCSideB.MCSetBookmark.MCBookmark._visible = false;
        eff_ShowHide_Delay(2000, MCFooter.MCSideB.MCSetBookmark.MCBookmark, MCFooter.MCSideB.MCSetBookmark.MCSuccess);
        fn_SetLyricState();
    } // end else if
};
MCFooter.MCSideB.MCSetFavorite.MCFailure._visible = false;
MCFooter.MCSideB.MCSetFavorite.MCSuccess._visible = false;
MCFooter.MCSideB.MCSetFavorite.MCFavorite.onRelease = function ()
{
    var _loc1;
    _loc1 = ext_fscommand2("KeyAudFavorite");
    if (_loc1 < 0)
    {
        MCFooter.MCSideB.MCSetFavorite.MCFavorite._visible = false;
        eff_ShowHide_Delay(2000, MCFooter.MCSideB.MCSetFavorite.MCFavorite, MCFooter.MCSideB.MCSetFavorite.MCFailure);
    }
    else
    {
        MCFooter.MCSideB.MCSetFavorite.MCFavorite._visible = false;
        eff_ShowHide_Delay(2000, MCFooter.MCSideB.MCSetFavorite.MCFavorite, MCFooter.MCSideB.MCSetFavorite.MCSuccess);
        fn_SetLyricState();
    } // end else if
};
MCFooter.MCSideB.MCSetBt.MCBtOn._visible = false;
MCFooter.MCSideB.MCSetBt.MCBtSuccess._visible = false;
MCFooter.MCSideB.MCSetBt.MCBtFailure._visible = false;
MCFooter.MCSideB.MCSetBt.MCBtConnecting._visible = false;
fn_loop_BtState = function ()
{
    var _loc1 = ext_fscommand2("GetBTHState");
    if (fn_loop_BtState_i >= 100000)
    {
        clearInterval(fn_loop_BtState_Int);
    }
    else if (_loc1 == 1)
    {
        MCFooter.MCSideB.MCSetBt.MCBtOn._visible = true;
        MCFooter.MCSideB.MCSetBt.MCBtOff._visible = false;
        clearInterval(fn_loop_BtState_Int);
    }
    else
    {
        fn_loop_BtState_i = fn_loop_BtState_i + 500;
    } // end else if
};
var fn_loop_BtState_i = 0;
var fn_loop_BtState_Int = setInterval(fn_loop_BtState, 500);
MCFooter.MCSideB.MCSetBt.MCBtOff.onRelease = function ()
{
    this.gotoAndStop(1);
    ext_fscommand2("SetBTHState", "1");
    MCFooter.MCSideB.MCSetBt.MCBtOff._visible = false;
    MCFooter.MCSideB.MCSetBt.MCBtConnecting._visible = true;
    MCFooter.MCSideB.MCSetBt.MCBtConnecting.onEnterFrame = function ()
    {
        var _loc1 = 0;
        if (MCInfobar.MCBluetooth._visible == true)
        {
            MCFooter.MCSideB.MCSetBt.MCBtConnecting._visible = false;
            eff_ShowHide_Delay(2000, MCFooter.MCSideB.MCSetBt.MCBtOn, MCFooter.MCSideB.MCSetBt.MCBtSuccess);
            delete MCFooter.MCSideB.MCSetBt.MCBtConnecting.onEnterFrame;
        }
        else if (_loc1 >= 240)
        {
            MCFooter.MCSideB.MCSetBt.MCBtConnecting._visible = false;
            eff_ShowHide_Delay(2000, MCFooter.MCSideB.MCSetBt.MCBtOff, MCFooter.MCSideB.MCSetBt.MCBtFailure);
            delete MCFooter.MCSideB.MCSetBt.MCBtConnecting.onEnterFrame;
        }
        else
        {
            ++_loc1;
        } // end else if
    };
};
MCFooter.MCSideB.MCSetBt.MCBtOn.onRelease = function ()
{
    this.gotoAndStop(1);
    ext_fscommand2("SetBTHState", "0");
    MCFooter.MCSideB.MCSetBt.MCBtOn._visible = false;
    MCFooter.MCSideB.MCSetBt.MCBtOff._visible = true;
};
MCPopAdd.MCPopBt.onRelease = function ()
{
    _global.gfn_SetPopupMCName(null, 0);
    fn_SetLyricState();
    this.gotoAndStop(1);
};
MCFooter.MCSideB.MCSetBoundary.onPress = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(2);
    } // end if
};
MCFooter.MCSideB.MCSetBoundary.onDragOut = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(1);
    } // end if
};
MCFooter.MCSideB.MCSetBoundary.onRelease = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(1);
        fn_MCSideB_ONPanal_OffAll();
        MCFooter.MCSideB.MCSetBoundaryON._visible = true;
        MCFooter.MCSideB.MCSetFavorite._visible = false;
        MCFooter.MCSideB.MCSetBookmark._visible = false;
    } // end if
};
MCFooter.MCSideB.MCSetBoundaryON.OFF.onPress = function ()
{
    this.gotoAndStop(2);
};
MCFooter.MCSideB.MCSetBoundaryON.OFF.onDragOut = function ()
{
    this.gotoAndStop(1);
};
MCFooter.MCSideB.MCSetBoundaryON.OFF.onRelease = function ()
{
    this.gotoAndStop(1);
    fn_MCSideB_ONPanal_OffAll();
};
MCFooter.MCSideB.MCSetEQ.onPress = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(2);
    } // end if
};
MCFooter.MCSideB.MCSetEQ.onDragOut = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(1);
    } // end if
};
MCFooter.MCSideB.MCSetEQ.onRelease = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(1);
        fn_MCSideB_ONPanal_OffAll();
        MCFooter.MCSideB.MCSetEQON._visible = true;
        MCFooter.MCSideB.MCSetFavorite._visible = false;
        MCFooter.MCSideB.MCSetBookmark._visible = false;
    } // end if
};
MCFooter.MCSideB.MCSetEQON.OFF.onPress = function ()
{
    this.gotoAndStop(2);
};
MCFooter.MCSideB.MCSetEQON.OFF.onDragOut = function ()
{
    this.gotoAndStop(1);
};
MCFooter.MCSideB.MCSetEQON.OFF.onRelease = function ()
{
    this.gotoAndStop(1);
    fn_MCSideB_ONPanal_OffAll();
};
MCFooter.MCSideB.MCSetSpeed.onPress = function ()
{
    this.gotoAndStop(2);
};
MCFooter.MCSideB.MCSetSpeed.onDragOut = function ()
{
    this.gotoAndStop(1);
};
MCFooter.MCSideB.MCSetSpeed.onRelease = function ()
{
    this.gotoAndStop(1);
    fn_MCSideB_ONPanal_OffAll();
    MCFooter.MCSideB.MCSetSpeedON._visible = true;
    MCFooter.MCSideB.MCGoSettings._visible = false;
};
MCFooter.MCSideB.MCSetSpeedON.OFF.onPress = function ()
{
    this.gotoAndStop(2);
};
MCFooter.MCSideB.MCSetSpeedON.OFF.onDragOut = function ()
{
    this.gotoAndStop(1);
};
MCFooter.MCSideB.MCSetSpeedON.OFF.onRelease = function ()
{
    this.gotoAndStop(1);
    fn_MCSideB_ONPanal_OffAll();
};
MCFooter.MCSideB.MCMenuShow.MC1.onPress = MCFooter.MCSideB.MCMenuShow.MC2.onPress = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(2);
    } // end if
};
MCFooter.MCSideB.MCMenuShow.MC1.onDragOut = MCFooter.MCSideB.MCMenuShow.MC2.onDragOut = function ()
{
    this.gotoAndStop(1);
};
MCFooter.MCSideB.MCMenuShow.MC1.onRelease = function ()
{
    this.gotoAndStop(1);
    if (_global.gfn_GetPopupMCName() == null)
    {
        SOL_ASUCI1_MUSIC.data.MCSideB_Show = 2;
        SOL_ASUCI1_MUSIC.flush();
        MCFooter.MCSideB.MCMenuShow.MC1._visible = false;
        MCFooter.MCSideB.MCMenuShow.MC2._visible = true;
    } // end if
};
MCFooter.MCSideB.MCMenuShow.MC2.onRelease = function ()
{
    this.gotoAndStop(1);
    if (_global.gfn_GetPopupMCName() == null)
    {
        SOL_ASUCI1_MUSIC.data.MCSideB_Show = 1;
        SOL_ASUCI1_MUSIC.flush();
        MCFooter.MCSideB.MCMenuShow.MC1._visible = true;
        MCFooter.MCSideB.MCMenuShow.MC2._visible = false;
    } // end if
};
MCFooter.MCSideB.MCSetG.MCSwingPivotOff.onPress = MCFooter.MCSideB.MCSetG.MCSwingOn.onPress = MCFooter.MCSideB.MCSetG.MCPivotOn.onPress = MCFooter.MCSideB.MCSetG.MCSetEQ.onPress = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(2);
    } // end if
};
MCFooter.MCSideB.MCSetG.MCSwingPivotOff.onDragOut = MCFooter.MCSideB.MCSetG.MCSwingOn.onDragOut = MCFooter.MCSideB.MCSetG.MCPivotOn.onDragOut = MCFooter.MCSideB.MCSetG.MCSetEQ.onDragOut = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(1);
    } // end if
};
MCFooter.MCSideB.MCSetG.MCSwingPivotOff.onRelease = MCFooter.MCSideB.MCSetG.MCSwingOn.onRelease = MCFooter.MCSideB.MCSetG.MCPivotOn.onRelease = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(1);
        if (_root.gHoldPivot == true && _root.gHoldSwing == true)
        {
            MCFooter.MCSideB.MCSetG.MCSwingPivotOff._visible = false;
            MCFooter.MCSideB.MCSetG.MCSwingOn._visible = false;
            MCFooter.MCSideB.MCSetG.MCPivotOn._visible = true;
            _root.gHoldPivot = false;
            _root.gHoldSwing = true;
        }
        else if (_root.gHoldPivot == true)
        {
            MCFooter.MCSideB.MCSetG.MCSwingPivotOff._visible = true;
            MCFooter.MCSideB.MCSetG.MCSwingOn._visible = false;
            MCFooter.MCSideB.MCSetG.MCPivotOn._visible = false;
            _root.gHoldPivot = true;
            _root.gHoldSwing = true;
            _root.prevRotation = -2;
            _root.fn_InputKeyHandler(KEY_DISPLAY_ROTATE);
        }
        else if (_root.gHoldSwing == true)
        {
            MCFooter.MCSideB.MCSetG.MCSwingPivotOff._visible = false;
            MCFooter.MCSideB.MCSetG.MCSwingOn._visible = true;
            MCFooter.MCSideB.MCSetG.MCPivotOn._visible = false;
            _root.gHoldPivot = true;
            _root.gHoldSwing = false;
        }
        else
        {
            MCFooter.MCSideB.MCSetG.MCSwingPivotOff._visible = false;
            MCFooter.MCSideB.MCSetG.MCSwingOn._visible = false;
            MCFooter.MCSideB.MCSetG.MCPivotOn._visible = true;
            _root.gHoldPivot = false;
            _root.gHoldSwing = true;
        } // end else if
        _root.fn_Music_SaveData(0);
    } // end if
};
MCFooter.MCSideB.MCSetAB.MCA.onPress = MCFooter.MCSideB.MCSetAB.MCB.onPress = MCFooter.MCSideB.MCSetAB.MCReady.onPress = function ()
{
    this.gotoAndStop(2);
};
MCFooter.MCSideB.MCSetAB.MCA.onDragOut = MCFooter.MCSideB.MCSetAB.MCB.onDragOut = MCFooter.MCSideB.MCSetAB.MCReady.onDragOut = function ()
{
    this.gotoAndStop(1);
};
MCFooter.MCSideB.MCSetAB.MCA.onRelease = MCFooter.MCSideB.MCSetAB.MCB.onRelease = MCFooter.MCSideB.MCSetAB.MCReady.onRelease = function ()
{
    var _loc2;
    this.gotoAndStop(1);
    _loc2 = ext_fscommand2("KeyAudABMode");
    if (_loc2 == g_PlayABRepeat)
    {
        fn_SetABRepeat(g_PlayABRepeat, 1);
    }
    else
    {
        g_PlayABRepeat = _loc2;
        fn_SetABRepeat(g_PlayABRepeat, 0);
    } // end else if
};
MCTouch_Tag.onPress = function ()
{
    this.gotoAndStop(2);
};
MCTouch_Tag.onDragOut = function ()
{
    this.gotoAndStop(1);
};
MCTouch_Tag.onRelease = function ()
{
    this.gotoAndStop(1);
    if (MCPlayInfo.TXTitle.text !== "Unknown" && TXArtistTEXT !== "Unknown" && TXAlbumTEXT !== "Unknown")
    {
        if (SOL_ASUCI1_MUSIC.data.PlayInfo_Mode == "tag")
        {
            SOL_ASUCI1_MUSIC.data.PlayInfo_Mode = "filename";
            SOL_ASUCI1_MUSIC.flush();
        }
        else
        {
            SOL_ASUCI1_MUSIC.data.PlayInfo_Mode = "tag";
            SOL_ASUCI1_MUSIC.flush();
        } // end if
    } // end else if
    fn_PlayInfo_Mode(SOL_ASUCI1_MUSIC.data.PlayInfo_Mode);
};
MCFooter.MCSideB.Hide_SideB.onPress = function ()
{
    this.gotoAndStop(2);
};
MCFooter.MCSideB.Hide_SideB.onDragOut = function ()
{
    this.gotoAndStop(1);
};
MCFooter.MCSideB.Hide_SideB.onRelease = function ()
{
    this.gotoAndStop(1);
    MCFooter.MCSideB._visible = false;
    fn_MCSideB_ONPanal_OffAll();
    if (Lyrics_forceOff == true && ext_fscommand2("GetAudLDBType") > 0 && _global.gfn_GetPopupMCName() != "MCPopEqSet")
    {
        var _loc3 = ext_fscommand2("EtcUsrGetNumber", 0);
        if (_loc3 == 1)
        {
            ext_fscommand2("EtcUsrSetNumber", 0, 0);
        } // end if
    } // end if
    fn_SetLyricState();
};
Lyric_Touch2.onRelease = function ()
{
    if (ext_fscommand2("GetAudLDBType") > 0 && _global.gfn_GetPopupMCName() != "MCPopEqSet")
    {
        var _loc2 = ext_fscommand2("EtcUsrGetNumber", 0);
        if (_loc2 == 0)
        {
            ext_fscommand2("EtcUsrSetNumber", 0, 1);
        }
        else if (_loc2 == 1)
        {
            ext_fscommand2("EtcUsrSetNumber", 0, 0);
        } // end if
    } // end else if
    fn_SetLyricState();
};
Lyric_Touch.onRelease = function ()
{
    if (ext_fscommand2("GetAudLDBType") > 0 && _global.gfn_GetPopupMCName() != "MCPopEqSet")
    {
        var _loc2 = ext_fscommand2("EtcUsrGetNumber", 0);
        if (_loc2 == 0)
        {
            ext_fscommand2("EtcUsrSetNumber", 0, 1);
        }
        else if (_loc2 == 1)
        {
            ext_fscommand2("EtcUsrSetNumber", 0, 0);
        } // end if
    } // end else if
    fn_SetLyricState();
};
Lyric_Back.onPress = function ()
{
    AlbumTouchGapX = this._xmouse;
    AlbumTouchGapY = this._ymouse;
};
Lyric_Back.onRelease = function ()
{
    if (Math.abs(this._xmouse - AlbumTouchGapX) < 20 && Math.abs(this._ymouse - AlbumTouchGapY) < 20 && _global.gfn_GetPopupMCName() == null)
    {
        if (ext_fscommand2("GetAudLDBType") > 0 && _global.gfn_GetPopupMCName() != "MCPopEqSet")
        {
            var _loc3 = ext_fscommand2("EtcUsrGetNumber", 0);
            if (_loc3 == 0)
            {
                ext_fscommand2("EtcUsrSetNumber", 0, 1);
            }
            else if (_loc3 == 1)
            {
                ext_fscommand2("EtcUsrSetNumber", 0, 0);
            } // end if
        } // end else if
        fn_SetLyricState();
    } // end if
};
var Lyrics_forceOff = false;
var chkTime0 = 500;
var count0 = 0;
var timeTerm0;
var firstClick0;
var secondClick0;
MCAlbum.onPress = function ()
{
    if (getTimer() - firstClick0 > chkTime0)
    {
        count0 = 0;
    } // end if
    AlbumTouchGapX = this._xmouse;
    AlbumTouchGapY = this._ymouse;
    ++count0;
    count0 == 1 ? (firstClick0 = getTimer()) : (secondClick0 = getTimer());
    if (count0 == 2)
    {
        timeTerm0 = secondClick0 - firstClick0;
    } // end if
};
MCAlbum.onRelease = function ()
{
    if (Math.abs(this._xmouse - AlbumTouchGapX) < 20 && Math.abs(this._ymouse - AlbumTouchGapY) < 20 && _global.gfn_GetPopupMCName() == null)
    {
        if (SOL_ASUCI1_MUSIC.data.MCSideB_Show == 2 && count0 == 2 && timeTerm0 < chkTime0 || SOL_ASUCI1_MUSIC.data.MCSideB_Show == 1)
        {
            MCFooter.MCSideB._visible = true;
            fn_forceOff_Lyrics();
        } // end if
    }
    else if (Math.abs(this._xmouse - AlbumTouchGapX) < 20)
    {
        if (this._ymouse - AlbumTouchGapY > 20)
        {
            fn_InputKeyHandler(KEY_MINUS_SHORT);
            fn_forceOff_Lyrics();
            MCArrow_Up.gotoAndStop(1);
            MCArrow_Down.gotoAndPlay(3);
        }
        else if (this._ymouse - AlbumTouchGapY < -20)
        {
            fn_InputKeyHandler(KEY_PLUS_SHORT);
            fn_forceOff_Lyrics();
            MCArrow_Down.gotoAndStop(1);
            MCArrow_Up.gotoAndPlay(3);
        } // end else if
    } // end else if
};
MCArrow_Down.onPress = MCArrow_Up.OnPress = function ()
{
    AlbumTouchGapX = this._xmouse;
    AlbumTouchGapY = this._ymouse;
};
MCArrow_Down.OnRelease = MCArrow_Up.OnRelease = function ()
{
    if (Math.abs(this._xmouse - AlbumTouchGapX) < 20 && Math.abs(this._ymouse - AlbumTouchGapY) < 20 && _global.gfn_GetPopupMCName() == null)
    {
        ext_fscommand2("KeyComMinus");
        _global.gfn_DispVolume(1);
        MCArrow_Up.gotoAndStop(1);
        MCArrow_Down.gotoAndPlay(3);
    }
    else if (Math.abs(this._xmouse - AlbumTouchGapX) < 20)
    {
        if (this._ymouse - AlbumTouchGapY > 20)
        {
            fn_InputKeyHandler(KEY_MINUS_SHORT);
            MCArrow_Up.gotoAndStop(2);
            MCArrow_Down.gotoAndPlay(3);
        }
        else if (this._ymouse - AlbumTouchGapY < -20)
        {
            fn_InputKeyHandler(KEY_PLUS_SHORT);
            MCArrow_Down.gotoAndStop(2);
            MCArrow_Up.gotoAndPlay(3);
        } // end else if
    } // end else if
};
MCArrow_Up.OnRelease = function ()
{
    if (Math.abs(this._xmouse - AlbumTouchGapX) < 20 && Math.abs(this._ymouse - AlbumTouchGapY) < 20 && _global.gfn_GetPopupMCName() == null)
    {
        ext_fscommand2("KeyComPlus");
        _global.gfn_DispVolume(1);
        MCArrow_Down.gotoAndStop(1);
        MCArrow_Up.gotoAndPlay(3);
    }
    else if (Math.abs(this._xmouse - AlbumTouchGapX) < 20)
    {
        if (this._ymouse - AlbumTouchGapY > 20)
        {
            fn_InputKeyHandler(KEY_MINUS_SHORT);
            MCArrow_Up.gotoAndStop(2);
            MCArrow_Down.gotoAndPlay(3);
        }
        else if (this._ymouse - AlbumTouchGapY < -20)
        {
            fn_InputKeyHandler(KEY_PLUS_SHORT);
            MCArrow_Down.gotoAndStop(2);
            MCArrow_Up.gotoAndPlay(3);
        } // end else if
    } // end else if
};
MCPopEqSet.MCEqString2.onRelease = function ()
{
    fn_PrevAction_EQPopup(1);
};
MCPopEqSet.MCEqString1.onRelease = function ()
{
    fn_PrevAction_EQPopup(2);
};
MCPopEqSet.MCEqString3.onRelease = function ()
{
    ext_fscommand2("SetJetEffectIndex", curJetPresetIndex);
    _global.gfn_SetPopupMCName(null, 0);
    fn_SetLyricState();
    _global.gfn_Key_SetVirtualKeyMC(_root.MCCon.MCAlbum);
    fn_GetFileInfo(_root.Album_C);
};
MCPopEqSet.MCEqString4.onRelease = function ()
{
    fn_NextAction_EQPopup(1);
};
MCPopEqSet.MCEqString5.onRelease = function ()
{
    fn_NextAction_EQPopup(2);
};
MCPopPlayMode.MCPopClose.onRelease = function ()
{
    _global.gfn_SetPopupMCName(null, 0);
    fn_SetLyricState();
};
MCPopAlbumMode.MCPopClose.onRelease = function ()
{
    _global.gfn_SetPopupMCName(null, 0);
    fn_SetLyricState();
};
MCPopEqSet.MCPopClose.onRelease = function ()
{
    _global.gfn_SetPopupMCName(null, 0);
    _global.gfn_Key_SetVirtualKeyMC(_root.MCCon.MCAlbum);
    fn_SetLyricState();
};
MCFooter.MCSideB.MCSetBoundaryON.RepeatOff.onPress = MCFooter.MCSideB.MCSetBoundaryON.RepeatOn.onPress = function ()
{
    this.gotoAndStop(2);
};
MCFooter.MCSideB.MCSetBoundaryON.RepeatOff.onDragOut = MCFooter.MCSideB.MCSetBoundaryON.RepeatOn.onDragOut = function ()
{
    this.gotoAndStop(1);
};
MCFooter.MCSideB.MCSetBoundaryON.RepeatOff.onRelease = MCFooter.MCSideB.MCSetBoundaryON.RepeatOn.onRelease = function ()
{
    this.gotoAndStop(1);
    ++g_PlayRepeat;
    if (g_PlayRepeat > 1)
    {
        g_PlayRepeat = 0;
    } // end if
    fn_SetRepeat(g_PlayRepeat, 1);
    if (gTotalFileNum >= 0 && gCurrFileNum >= 0)
    {
        fn_randomCoverA("CC", gCurrFileNum, _root.Album_C);
        var _loc3 = gCurrFileNum - 1;
        if (_loc3 == -1)
        {
            _loc3 = gTotalFileNum - 1;
        } // end if
        fn_randomCoverA("P", _loc3, _root.Album_P);
        fn_Music_Get_AlbumCover(_loc3, _root.Album_P);
        _loc3 = gCurrFileNum + 1;
        if (_loc3 == gTotalFileNum)
        {
            _loc3 = 0;
        } // end if
        fn_randomCoverA("F", _loc3, _root.Album_F);
        fn_Music_Get_AlbumCover(_loc3, _root.Album_F);
    } // end if
    gPrevFileNum = gCurrFileNum;
};
MCFooter.MCSideB.MCSetBoundaryON.ShuffleOn.onPress = MCFooter.MCSideB.MCSetBoundaryON.ShuffleOff.onPress = function ()
{
    this.gotoAndStop(2);
};
MCFooter.MCSideB.MCSetBoundaryON.ShuffleOn.onDragOut = MCFooter.MCSideB.MCSetBoundaryON.ShuffleOff.onDragOut = function ()
{
    this.gotoAndStop(1);
};
MCFooter.MCSideB.MCSetBoundaryON.ShuffleOn.onRelease = MCFooter.MCSideB.MCSetBoundaryON.ShuffleOff.onRelease = function ()
{
    this.gotoAndStop(1);
    ++g_PlayShuffle;
    if (g_PlayShuffle > 1)
    {
        g_PlayShuffle = 0;
    } // end if
    fn_SetShuffle(g_PlayShuffle, 1);
    if (gTotalFileNum >= 0 && gCurrFileNum >= 0)
    {
        fn_randomCoverA("CC", gCurrFileNum, _root.Album_C);
        var _loc3 = gCurrFileNum - 1;
        if (_loc3 == -1)
        {
            _loc3 = gTotalFileNum - 1;
        } // end if
        fn_randomCoverA("P", _loc3, _root.Album_P);
        fn_Music_Get_AlbumCover(_loc3, _root.Album_P);
        _loc3 = gCurrFileNum + 1;
        if (_loc3 == gTotalFileNum)
        {
            _loc3 = 0;
        } // end if
        fn_randomCoverA("F", _loc3, _root.Album_F);
        fn_Music_Get_AlbumCover(_loc3, _root.Album_F);
    } // end if
    gPrevFileNum = gCurrFileNum;
};
MCFooter.MCSideB.MCSetBoundaryON.All.onPress = MCFooter.MCSideB.MCSetBoundaryON.One.onPress = MCFooter.MCSideB.MCSetBoundaryON.Folder.onPress = function ()
{
    this.gotoAndStop(2);
};
MCFooter.MCSideB.MCSetBoundaryON.All.onDragOut = MCFooter.MCSideB.MCSetBoundaryON.One.onDragOut = MCFooter.MCSideB.MCSetBoundaryON.Folder.onDragOut = function ()
{
    this.gotoAndStop(1);
};
MCFooter.MCSideB.MCSetBoundaryON.All.onRelease = MCFooter.MCSideB.MCSetBoundaryON.Folder.onRelease = MCFooter.MCSideB.MCSetBoundaryON.One.onRelease = function ()
{
    this.gotoAndStop(1);
    ++g_PlayBoundary;
    if (g_PlayBoundary > 2)
    {
        g_PlayBoundary = 0;
    } // end if
    fn_SetBoundary(g_PlayBoundary, 1);
    if (gTotalFileNum >= 0 && gCurrFileNum >= 0)
    {
        var _loc3 = gCurrFileNum - 1;
        if (_loc3 == -1)
        {
            _loc3 = gTotalFileNum - 1;
        } // end if
        fn_Music_Get_AlbumCover(_loc3, _root.Album_P);
        _loc3 = gCurrFileNum + 1;
        if (_loc3 == gTotalFileNum)
        {
            _loc3 = 0;
        } // end if
        fn_Music_Get_AlbumCover(_loc3, _root.Album_F);
    } // end if
    gPrevFileNum = gCurrFileNum;
};
MCFooter.MCSideB.MCSetEQON.User1_Off.onPress = MCFooter.MCSideB.MCSetEQON.User2_Off.onPress = MCFooter.MCSideB.MCSetEQON.User3_Off.onPress = MCFooter.MCSideB.MCSetEQON.User4_Off.onPress = MCFooter.MCSideB.MCSetEQON.User1_On.onPress = MCFooter.MCSideB.MCSetEQON.User2_On.onPress = MCFooter.MCSideB.MCSetEQON.User3_On.onPress = MCFooter.MCSideB.MCSetEQON.User4_On.onPress = function ()
{
    this.gotoAndStop(2);
};
MCFooter.MCSideB.MCSetEQON.User1_Off.onDragOut = MCFooter.MCSideB.MCSetEQON.User2_Off.onDragOut = MCFooter.MCSideB.MCSetEQON.User3_Off.onDragOut = MCFooter.MCSideB.MCSetEQON.User4_Off.onDragOut = MCFooter.MCSideB.MCSetEQON.User1_On.onDragOut = MCFooter.MCSideB.MCSetEQON.User2_On.onDragOut = MCFooter.MCSideB.MCSetEQON.User3_On.onDragOut = MCFooter.MCSideB.MCSetEQON.User4_On.onDragOut = function ()
{
    this.gotoAndStop(1);
};
var fn_MCSetEQON_Release = function (num)
{
    ext_fscommand2("SetJetEffectIndex", num);
    _global.gfn_SetPopupMCName(null, 0);
    fn_SetLyricState();
    _global.gfn_Key_SetVirtualKeyMC(_root.MCCon.MCAlbum);
    fn_GetFileInfo(_root.Album_C);
    for (i = 1; i <= 4; i++)
    {
        MCFooter.MCSideB.MCSetEQON["User" + i + "_Off"]._visible = true;
        MCFooter.MCSideB.MCSetEQON["User" + i + "_On"]._visible = false;
    } // end of for
    if (num < 4)
    {
        MCFooter.MCSideB.MCSetEQON["User" + (num + 1) + "_On"]._visible = true;
    } // end if
};
MCFooter.MCSideB.MCSetEQON.User1_Off.onRelease = function ()
{
    this.gotoAndStop(1);
    fn_MCSetEQON_Release(0);
};
MCFooter.MCSideB.MCSetEQON.User2_Off.onRelease = function ()
{
    this.gotoAndStop(1);
    fn_MCSetEQON_Release(1);
};
MCFooter.MCSideB.MCSetEQON.User3_Off.onRelease = function ()
{
    this.gotoAndStop(1);
    fn_MCSetEQON_Release(2);
};
MCFooter.MCSideB.MCSetEQON.User4_Off.onRelease = function ()
{
    this.gotoAndStop(1);
    fn_MCSetEQON_Release(3);
};
MCFooter.MCSideB.MCSetEQON.User1_On.onRelease = MCFooter.MCSideB.MCSetEQON.User2_On.onRelease = MCFooter.MCSideB.MCSetEQON.User3_On.onRelease = MCFooter.MCSideB.MCSetEQON.User4_On.onRelease = function ()
{
    this.gotoAndStop(1);
    fn_MCSetEQON_Release(4);
};
MCFooter.MCSideB.MCSetSpeedON.MCPrev.onPress = MCFooter.MCSideB.MCSetSpeedON.MCNext.onPress = function ()
{
    this.gotoAndStop(2);
};
MCFooter.MCSideB.MCSetSpeedON.MCPrev.DragOut = MCFooter.MCSideB.MCSetSpeedON.MCNext.DragOut = function ()
{
    this.gotoAndStop(1);
};
MCFooter.MCSideB.MCSetSpeedON.MCPrev.onRelease = function ()
{
    this.gotoAndStop(1);
    var _loc3 = ext_fscommand2("GetAudPSpeed");
    var _loc2 = _loc3 - 1;
    if (_loc2 == 9)
    {
        MCFooter.MCSideB.MCSetSpeedON.MCNext._visible = true;
        MCFooter.MCSideB.MCSetSpeedON.MCPNext_Off._visible = false;
    }
    else if (_loc2 <= 0)
    {
        _loc2 = 0;
        MCFooter.MCSideB.MCSetSpeedON.MCPrev._visible = false;
        MCFooter.MCSideB.MCSetSpeedON.MCPrev_Off._visible = true;
    } // end else if
    ext_fscommand2("SetAudPSpeed", _loc2);
    MCFooter.MCSideB.MCSetSpeed.MCValue.gotoAndStop(_loc2 + 1);
};
MCFooter.MCSideB.MCSetSpeedON.MCNext.onRelease = function ()
{
    this.gotoAndStop(1);
    var _loc3 = ext_fscommand2("GetAudPSpeed");
    var _loc2 = _loc3 + 1;
    if (_loc2 == 1)
    {
        MCFooter.MCSideB.MCSetSpeedON.MCPrev._visible = true;
        MCFooter.MCSideB.MCSetSpeedON.MCPrev_Off._visible = false;
    }
    else if (_loc2 >= 10)
    {
        _loc2 = 10;
        MCFooter.MCSideB.MCSetSpeedON.MCNext._visible = false;
        MCFooter.MCSideB.MCSetSpeedON.MCPNext_Off._visible = true;
    } // end else if
    ext_fscommand2("SetAudPSpeed", _loc2);
    MCFooter.MCSideB.MCSetSpeed.MCValue.gotoAndStop(_loc2 + 1);
};
MCFooter.MCSideB.MCFlip.onRelease = MCFooter.MCSideA.MCFlip.onRelease = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        gfn_flipFooter(MCFooter.MCSideA, MCFooter.MCSideB, SCROLL_HORIZONTAL, 0);
        _root.FooterSide = _root.FooterSide ^ 1;
        _root.fn_Music_SaveData(0);
    } // end if
};
MCFooter.MCSideB.MCGoTop.onPress = MCFooter.MCSideB.MCGoSettings.onPress = MCFooter.MCSideB.ICGoList.onPress = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(2);
    } // end if
};
MCFooter.MCSideB.MCGoTop.onDragOut = MCFooter.MCSideB.MCGoSettings.onDragOut = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(1);
    } // end if
};
MCFooter.MCSideB.MCGoTop.onRelease = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(1);
        if (ext_fscommand2("GetAudNedPlayState") == 2)
        {
            ext_fscommand2("KeyAudStop");
            return;
        } // end if
        _global.Load_SWF(MODE_MAIN);
    } // end if
};
_global.SOL_ASUCI1_COMMON = SharedObject.getLocal("ASUCI1_COMMON");
MCFooter.MCSideB.MCGoSettings.onRelease = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(1);
        if (ext_fscommand2("GetAudNedPlayState") == 2)
        {
            ext_fscommand2("KeyAudStop");
            return;
        } // end if
        SOL_ASUCI1_COMMON.data.LastMode = "Music";
        SOL_ASUCI1_COMMON.flush();
        _global.Load_SWF(MODE_SETTING);
    } // end if
};
MCHeader.MCReturn.onPress = MCHeader.MCGoTop.onPress = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(2);
    } // end if
};
MCHeader.MCReturn.onDragOut = MCHeader.MCGoTop.onDragOut = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(1);
    } // end if
};
MCHeader.MCGoTop.onRelease = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(1);
        fn_DestroyFrame();
        _global.Load_SWF(MODE_MAIN);
    } // end if
};
MCFooter.MCSideB.ICGoList.onDragOut = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        if (gTotalFileNum == 0)
        {
            this.gotoAndStop(3);
        }
        else
        {
            this.gotoAndStop(1);
        } // end if
    } // end else if
};
MCFooter.MCSideB.ICGoList.onRelease = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(1);
        if (ext_fscommand2("GetAudNedPlayState") == 2)
        {
            ext_fscommand2("KeyAudStop");
            return;
        } // end if
        _global.Load_SWF(MODE_BROWSER);
    } // end if
};
MCPopDRM.MCPopBt.onRelease = MCPopMsg.MCPopBt.onRelease = function ()
{
    _global.gfn_SetPopupMCName(null, 0);
    fn_SetLyricState();
};
MCPopDRM.MCYes.onPress = MCPopDRM.MCNo.onPress = function ()
{
    this.gotoAndStop(2);
};
MCPopDRM.MCYes.onDragOut = MCPopDRM.MCNo.onDragOut = function ()
{
    this.gotoAndStop(1);
};
MCPopDRM.MCYes.onRelease = function ()
{
    ext_fscommand2("SetAudNedPlayState", 1);
    _global.gfn_SetPopupMCName(null, 0);
    fn_SetLyricState();
    this.gotoAndStop(1);
};
MCPopDRM.MCNo.onRelease = function ()
{
    ext_fscommand2("SetAudNedPlayState", 0);
    _global.gfn_SetPopupMCName(null, 0);
    fn_SetLyricState();
    this.gotoAndStop(1);
};
MCQuickList.MCQuickButton.onPress = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(2);
    } // end if
};
MCQuickList.MCQuickButton.onDragOut = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(1);
    } // end if
};
MCQuickList.MCQuickButton.onRelease = function ()
{
    this.gotoAndStop(1);
    if (this.sw == 1 && _global.gfn_GetPopupMCName() == null)
    {
        _global.gfn_Key_SetVirtualKeyMC(MCQuickList.MCQuickTouch);
        gQuickCurrFileNum = gCurrFileNum;
        fn_Music_Get_QuickList_AlbumCover(gCurrFileNum);
        ext_fscommand2("GetEtcFileName", gCurrFileNum, "MCQuickList.TXTitle.text");
        this.sw = 2;
        fn_SetLyricState();
        MCQuickList.MCbox._x = MCQuickList.MCQLTouch2._x;
        gQuickSelectNum = 0;
        MCQuickList.MCQuickButton.MCArrow.gotoAndStop(2);
        MCQuickList.onEnterFrame = function ()
        {
            if (gfQuickListCover == 0)
            {
                this._x = this._x + (-98 - this._x) * 5.000000E-001;
                if (Math.floor(this._x) < -97)
                {
                    delete this.onEnterFrame;
                } // end if
            } // end if
        };
    }
    else if (this.sw == 2)
    {
        this.sw = 1;
        _global.gfn_Key_SetVirtualKeyMC(_root.MCCon.MCAlbum);
        MCQuickList.MCQuickButton.MCArrow.gotoAndStop(1);
        MCQuickList.onEnterFrame = function ()
        {
            this._x = this._x + (110 - this._x) * 3.000000E-001;
            if (Math.ceil(this._x) > 1.099000E+002)
            {
                delete this.onEnterFrame;
                fn_SetLyricState();
            } // end if
        };
    } // end else if
};
for (i = 1; i < 4; i++)
{
    MCQuickList["MCQLTouch" + i].onRelease = function ()
    {
        var _loc5 = this._x;
        var _loc3;
        MCQuickList.MCbox._x = _loc5;
        MCQuickList.MCbox.play();
        Num = Number(this._name.substring(9));
        _loc3 = gQuickCurrFileNum - 2 + Num;
        if (_loc3 < 0)
        {
            _loc3 = gTotalFileNum - 1;
        }
        else if (_loc3 >= gTotalFileNum)
        {
            _loc3 = 0;
        } // end else if
        if (gQuickSelectNum == Num)
        {
            var _loc4 = ext_fscommand2("KeyAudStop");
            if (_loc4 == 100)
            {
                return;
            } // end if
            _loc4 = ext_fscommand2("SetEtcCurPLIndex", _loc3);
            if (_loc4 >= 0)
            {
                gPrevQLNum = -1;
                ext_fscommand2("KeyAudPlay");
            } // end if
        }
        else
        {
            gQuickSelectNum = Num;
            ext_fscommand2("GetEtcFileName", _loc3, "MCQuickList.TXTitle.text");
            _global.gfn_Common_SetStringScroll(MCQuickList.TXTitle, 1);
        } // end else if
    };
} // end of for
onUnload = function ()
{
    _root.fn_Music_SaveData(1);
    ext_fscommand2("SetAudLDBConfig", _root.ldbconfigOff);
    _global.gfn_SetPopupMCName(null, 0);
    fn_Destroy_Fr1();
};
stop ();

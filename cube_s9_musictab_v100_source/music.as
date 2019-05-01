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
    MCPlayMode.MCABRepeat.gotoAndStop(g_PlayABRepeat + 1);
    MCPopDRM._visible = false;
    MCPopMsg._visible = false;
    MCPopPlayMode._visible = false;
    MCPopEqSet._visible = false;
    MCPopAlbumMode._visible = false;
    MCPopAdd._visible = false;
    MCPopResult._visible = false;
    gAlbumWidth = MCAlbumBG.MCAlbumArt._width;
    gAlbumHeight = MCAlbumBG.MCAlbumArt._height;
    gCurrFileNum = -1;
    fn_Reflush_AllDisplay();
	
	on_ani._visible = MCFooterVisible;
	MCFooter._visible = MCFooterVisible;
	
	/* 계속 보임
    if (_root.FooterSide == 1)
    {
        MCFooter.MCSideA._visible = false;
    }
    else
    {
        MCFooter.MCSideB._visible = false;
    }
	*/
	// end else if
    _root.ReflushFunc = fn_Reflush_AllDisplay;
    _root.DrawPlayModeFunc = fn_DrawCurrState;
    _root.DrawPlayTimeFunc = fn_SetPlayTime;
    _root.FrameDestroyFunc = fn_Destroy_Fr1;
	
	/*
    MCQuickList._x = 110;
    MCQuickList.MCQuickButton.MCArrow.gotoAndStop(1);
    MCQuickList.MCQuickButton.sw = 1;
    */
	
	fn_SetLyricState();
    _global.gfn_Key_SetVirtualKeyMC(MCAlbumBG);
    if (gTotalFileNum == 0)
    {
        MCHeader.ICGoList.gotoAndStop(3);
    } // end if
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
        MCPopPlayMode.MCRepeatOn._visible = false;
        MCPopPlayMode.MCRepeatOff._visible = true;
    }
    else if (repeat == 1)
    {
        MCPopPlayMode.MCRepeatOn._visible = true;
        MCPopPlayMode.MCRepeatOff._visible = false;
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
        MCPopPlayMode.MCShuffleOn._visible = false;
        MCPopPlayMode.MCShuffleOff._visible = true;
    }
    else if (shuffle == 1)
    {
        MCPopPlayMode.MCShuffleOn._visible = true;
        MCPopPlayMode.MCShuffleOff._visible = false;
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
            MCPopPlayMode.MCBoundaryAll._visible = true;
            MCPopPlayMode.MCBoundaryFolder._visible = false;
            MCPopPlayMode.MCBoundaryOne._visible = false;
            break;
        } 
        case 1:
        {
            MCPopPlayMode.MCBoundaryAll._visible = false;
            MCPopPlayMode.MCBoundaryFolder._visible = false;
            MCPopPlayMode.MCBoundaryOne._visible = true;
            break;
        } 
        case 2:
        {
            MCPopPlayMode.MCBoundaryAll._visible = false;
            MCPopPlayMode.MCBoundaryFolder._visible = true;
            MCPopPlayMode.MCBoundaryOne._visible = false;
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
            MCFooter.MCSideA.MCSetAB._visible = true;
            MCFooter.MCSideA.MCSetA._visible = false;
            MCFooter.MCSideA.MCSetB._visible = false;
            MCSeekBar.MCABSeekBG._visible = false;
            MCSeekBar.MCABSeekMask._width = 0;
            _root.ABModePosition[0] == 0;
            _root.ABModePosition[1] == 0;
            break;
        } 
        case 1:
        {
            MCFooter.MCSideA.MCSetAB._visible = false;
            MCFooter.MCSideA.MCSetA._visible = true;
            MCFooter.MCSideA.MCSetB._visible = false;
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
                MCSeekBar.MCABSeekMask._width = MCSeekBar.MCSeeker._x - _root.ABModePosition[0];
                MCSeekBar.MCABSeekBG.setMask(MCSeekBar.MCABSeekMask);
            } // end else if
            break;
        } 
        case 2:
        {
            MCFooter.MCSideA.MCSetAB._visible = false;
            MCFooter.MCSideA.MCSetA._visible = false;
            MCFooter.MCSideA.MCSetB._visible = true;
            if (Redraw != 1)
            {
                _root.ABmodePosition[1] = MCSeekBar.MCSeeker._x;
                MCSeekBar.MCABSeekMask._width = _root.ABmodePosition[1] - _root.ABModePosition[0];
                MCSeekBar.MCABSeekBG.setMask(MCSeekBar.MCABSeekMask);
            }
            else
            {
                MCSeekBar.MCABSeekMask._x = _root.ABModePosition[0];
                MCSeekBar.MCABSeekMask._width = _root.ABmodePosition[1] - _root.ABModePosition[0];
                MCSeekBar.MCABSeekBG.setMask(MCSeekBar.MCABSeekMask);
            } // end else if
            break;
        } 
    } // End of switch
    MCPlayMode.MCABRepeat.gotoAndStop(ABMode + 1);
} // End of the function
function fn_SetFileNumber()
{
    gCurrFileNum = ext_fscommand2("GetEtcCurPLIndex");
    gTotalFileNum = ext_fscommand2("GetEtcTotalPLNum");
    MCFileNum.text = gCurrFileNum + 1 + "/" + gTotalFileNum;
} // End of the function
function fn_SetPlayTime(updateAll)
{
    var _loc2 = 0;
    gCurPlayTime = ext_fscommand2("GetAudPlayTime");
    TXTimeCur.text = gfn_Common_GetTime2Text(gCurPlayTime);
    if (updateAll)
    {
        gTotalPlayTime = ext_fscommand2("GetAudTotalTime");
        TXTimeTotal.text = gfn_Common_GetTime2Text(gTotalPlayTime);
    } // end if
    if (_root.displayTime == 1)
    {
        gCurPlayTime = gTotalPlayTime - gCurPlayTime;
    } // end if
    _loc2 = gfn_Common_GetRatio(gTotalPlayTime, gCurPlayTime);
    gfn_Common_DrawSeekBar(MCSeekBar.MCSeekBG, MCSeekBar.MCSeeker, MCSeekBar.MCSeekMask, _loc2, SCROLL_HORIZONTAL);
    if (g_PlayABRepeat == 1)
    {
        MCSeekBar.MCABSeekMask._width = MCSeekBar.MCSeekMask._width + MCSeekBar.MCSeekMask._x - MCSeekBar.MCABSeekMask._x;
        MCSeekBar.MCABSeekBG.setMask(MCSeekBar.MCABSeekMask);
    } // end if
} // End of the function

/*
function fn_Music_Get_QuickList_AlbumCover(fileIndex)
{
    if (gPrevQLNum != fileIndex)
    {
        var _loc3;
        var _loc5;
        if (gfQuickListCover == 0)
        {
            var _loc2;
            for (i = 0; i < 3; i++)
            {
                switch (i)
                {
                    case 0:
                    {
                        MCQuickList.MCQuickBG1.MCFrame._visible = false;
                        MCQuickList.MCQuickBG1.MCCoverBG._visible = false;
                        _loc2 = fileIndex - 1;
                        if (_loc2 < 0)
                        {
                            _loc2 = gTotalFileNum - 1;
                        } // end if
                        _loc3 = _loc2 + ".MUS";
                        QuickcoverLoader1.unloadClip("MCQuickList.MCQuickBG1.MCAlbum");
                        _loc5 = QuickcoverLoader1.loadClip(_loc3, "MCQuickList.MCQuickBG1.MCAlbum");
                        QuickcoverLoader1.addListener(QuickcoverListener1);
                        break;
                    } 
                    case 1:
                    {
                        MCQuickList.MCQuickBG2.MCFrame._visible = false;
                        MCQuickList.MCQuickBG2.MCCoverBG._visible = false;
                        _loc3 = fileIndex + ".MUS";
                        gPrevQLNum = fileIndex;
                        QuickcoverLoader2.unloadClip("MCQuickList.MCQuickBG2.MCAlbum");
                        _loc5 = QuickcoverLoader2.loadClip(_loc3, "MCQuickList.MCQuickBG2.MCAlbum");
                        ext_fscommand2("GetEtcFileName", fileIndex, "MCQuickList.TXTitle.text");
                        _global.gfn_Common_SetStringScroll(MCQuickList.TXTitle, 1);
                        QuickcoverLoader2.addListener(QuickcoverListener2);
                        break;
                    } 
                    case 2:
                    {
                        MCQuickList.MCQuickBG3.MCFrame._visible = false;
                        MCQuickList.MCQuickBG3.MCCoverBG._visible = false;
                        _loc2 = fileIndex + 1;
                        if (_loc2 > gTotalFileNum - 1)
                        {
                            _loc2 = 0;
                        } // end if
                        _loc3 = _loc2 + ".MUS";
                        QuickcoverLoader3.unloadClip("MCQuickList.MCQuickBG3.MCAlbum");
                        _loc5 = QuickcoverLoader3.loadClip(_loc3, "MCQuickList.MCQuickBG3.MCAlbum");
                        QuickcoverLoader3.addListener(QuickcoverListener3);
                        break;
                    } 
                } // End of switch
                if (_loc5 == true)
                {
                    ++gfQuickListCover;
                } // end if
            } // end of for
        } // end if
    } // end if
} // End of the function
*/

function fn_Music_Get_AlbumCover(fileIndex)
{
    if (gPrevFileNum != fileIndex)
    {
        var _loc1;
        var _loc4;
        gPrevFileNum = fileIndex;
        if (gfloadedFlag == 0)
        {
            var _loc3;
            MCAlbumBg.MCFrame._visible = false;
            MCAlbumBG.MCCoverA._visible = false;
            MCAlbumBG.MCAlbumArt._visible = false;			
			MCAlbumBG.MCAlbumArtBG._visible = true;
            MCAlbumBG.MCCoverB._visible = false;
            _loc1 = fileIndex + ".MUS";
            coverLoader.unloadClip("MCAlbumBG.MCAlbumArt");
            coverLoader.loadClip(_loc1, MCAlbumBG.MCAlbumArt);
            gfloadedFlag = 1;
            coverLoader.addListener(coverListener);
        } // end if
    } // end if
} // End of the function
function fn_DrawCurrState()
{
    _global.g_PlayMode = ext_fscommand2("GetEtcState");
    if (_global.g_PlayMode == _global.STATE_MUSIC_PLAY)
    {
        MCFooter.MCSideA.MCPause._visible = true;
        MCFooter.MCSideA.MCPlay._visible = false;
    }
    else
    {
        MCFooter.MCSideA.MCPause._visible = false;
        MCFooter.MCSideA.MCPlay._visible = true;
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
    var _loc5;
    var _loc4;
    var _loc7;
    var _loc6;
    var _loc3 = _root.EQString.length;
    var _loc9 = MCFooter.MCSideA.MCPopEqSet;
    _loc4 = curIndex - 2;
    if (_loc4 < 0)
    {
        _loc4 = _loc3 + _loc4;
    } // end if
    _loc5 = curIndex - 1;
    if (_loc5 < 0)
    {
        _loc5 = _loc3 + _loc5;
    } // end if
    _loc7 = curIndex + 1;
    if (_loc7 >= _loc3)
    {
        _loc7 = _loc7 - _loc3;
    } // end if
    _loc6 = curIndex + 2;
    if (_loc6 >= _loc3)
    {
        _loc6 = _loc6 - _loc3;
    } // end if
    MCPopEqSet.MCEqString1.TXEqString.text = _root.EQString[_loc4];
    MCPopEqSet.MCEqString2.TXEqString.text = _root.EQString[_loc5];
    MCPopEqSet.MCEqString3.TXEqString.text = _root.EQString[curIndex];
    MCPopEqSet.MCEqString4.TXEqString.text = _root.EQString[_loc7];
    MCPopEqSet.MCEqString5.TXEqString.text = _root.EQString[_loc6];
    _global.gfn_Common_SetStringScroll(MCPopEqSet.MCEqString3.TXEqString, 1);
} // End of the function
function fn_SetTextScroll()
{
    //_global.gfn_Common_SetStringScroll(MCPlayInfo.TXArtist, 0);
    _global.gfn_Common_SetStringScroll(MCPlayInfo.TXTitle, 0);
    //_global.gfn_Common_SetStringScroll(MCPlayInfo.TXAlbum, 0);
    //_global.gfn_Common_SetStringScroll(MCHeader.TXFileName, 0);
} // End of the function
function fn_SetLyricState()
{
	/*
    if (ext_fscommand2("GetAudLDBType") > 0 && MCQuickList.MCQuickButton.sw == 1 && _global.gfn_GetPopupMCName() != "MCPopEqSet")
    {
        MCPlayInfo._visible = false;
        ext_fscommand2("SetAudLDBConfig", _root.ldbconfigOn);
    }
	*/
	if (ext_fscommand2("GetAudLDBType") > 0 && _global.gfn_GetPopupMCName() != "MCPopEqSet")
    {
        MCPlayInfo._visible = false;
        ext_fscommand2("SetAudLDBConfig", _root.ldbconfigOn);
    }
    else
    {
        MCPlayInfo._visible = true;
        ext_fscommand2("SetAudLDBConfig", _root.ldbconfigOff);
    } // end else if
} // End of the function
function fn_GetFileInfo()
{
    ext_fscommand2("GetAudArtist", gCurrFileNum, "MCPlayInfo.TXArtist.text");
    ext_fscommand2("GetAudAlbum", gCurrFileNum, "MCPlayInfo.TXAlbum.text");
    ext_fscommand2("GetAudTitle", gCurrFileNum, "MCPlayInfo.TXTitle.text");
    ext_fscommand2("GetEtcFileName", gCurrFileNum, "MCHeader.TXFileName.text");
    fn_SetTextScroll();
    ext_fscommand2("GetAudCodec", "MCAlbumBG.MCCoverB.TXCodec.text");
    MCAlbumBG.MCCoverB.TXBitRate.text = String(ext_fscommand2("GetAudBitRate")) + " kbps";
    MCAlbumBG.MCCoverB.TXSamplingRate.text = String(ext_fscommand2("GetAudSampleRate")) + " kHz";
    MCAlbumBG.MCCoverB.TXCurJetPreset.text = _root.EQString[ext_fscommand2("GetJetEffectIndex")];
    _global.gfn_Common_SetStringScroll(MCAlbumBG.MCCoverB.TXCurJetPreset, 1);
} // End of the function
function fn_Reflush_AllDisplay()
{
    var _loc3 = MCPopMsg.TXMsg.text;
    var _loc2;
    fn_SetPlayTime(1);
    fn_SetFileNumber();
    MCSeekBar.MCSeeker.onRelease();
    if (gTotalFileNum >= 0 && gCurrFileNum >= 0)
    {
        _loc2 = ext_fscommand2("GetEtcOpenState", "MCPopMsg.TXMsg.text");
        if (_loc2 == 0)
        {
            MCPopMsg.TXMsg.text = _loc3;
            fn_GetFileInfo();
            fn_SetLyricState();
        }
        else if (_loc2 >= 100)
        {
            MCPopDRM.TXTitle.text = MCPopMsg.TXMsg.text;
            _global.gfn_SetPopupMCName(MCPopDRM, 0);
        }
        else
        {
            _global.gfn_SetPopupMCName(MCPopMsg, 1);
        } // end else if
        g_PlayABRepeat = ext_fscommand2("GetAudABMode");
        fn_SetABRepeat(g_PlayABRepeat, 1);
        fn_Music_Get_AlbumCover(gCurrFileNum);
    }
    else
    {
        fn_GetFileInfo();
    } // end else if
    fn_DrawCurrState();
} // End of the function

/*
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
            MCQuickList["MCQuickBG" + i].lp = i * 68 - 13;
            MCQuickList["MCQuickBG" + i]._x = i * 68 - 13 + 67;
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
            MCQuickList["MCQuickBG" + i].lp = i * 68 - 13;
            MCQuickList["MCQuickBG" + i]._x = i * 68 - 13 - 67;
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
*/
function fn_Destroy_Fr1()
{
    delete coverLoader;
    delete coverListener;
	/*
    delete QuickcoverLoader1;
    delete QuickcoverLoader2;
    delete QuickcoverLoader3;
    delete QuickcoverListener1;
    delete QuickcoverListener2;
    delete QuickcoverListener3;
	*/
} // End of the function
var gTotalPlayTime;
var gCurPlayTime;
var gPrevFileNum = -1;
var gPrevQLNum = -1;
var gCurrFileNum;
var gTotalFileNum;

/*
var gQuickCurrFileNum;
var gQuickSelectNum;
*/

var gAlbumWidth;
var gAlbumHeight;
var gfloadedFlag = 0;
var gfCoverExist = 0;

/*
var gfQuickListCover = 0;
*/

var MCFooterVisible:Boolean = false;

var aniflag = 0;
var coverLoader = new MovieClipLoader();
var coverListener = new Object();

/*
var QuickcoverLoader1 = new MovieClipLoader();
var QuickcoverListener1 = new Object();
var QuickcoverLoader2 = new MovieClipLoader();
var QuickcoverListener2 = new Object();
var QuickcoverLoader3 = new MovieClipLoader();
var QuickcoverListener3 = new Object();
*/

var curJetPresetIndex;
coverListener.onLoadInit = function (mc)
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
    MCAlbumBg.MCFrame._visible = true;
    if (gfloadedFlag == 1)
    {
        gfCoverExist = 1;
        gfloadedFlag = 0;
        retval = coverLoader.removeListener(coverListener);
    } // end if
};
coverListener.onLoadError = function (mc, errorCode)
{
    if (gfloadedFlag == 1)
    {
        MCAlbumBg.MCFrame._visible = true;
        MCAlbumBG.MCCoverA._visible = true;
        gfCoverExist = 0;
        gfloadedFlag = 0;
        retval = coverLoader.removeListener(coverListener);
        MCAlbumBG.MCAlbumArt._visible = false;	
		MCAlbumBG.MCAlbumArtBG._visible = false;
    } // end if
};
/*
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
*/
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
            var _loc3;
            moveX = this._parent._xmouse - tx;
            moveY = this._parent._ymouse - ty;
            maskWidth = gfn_Common_GetSeekBarRatio(MCSeekBar.MCSeekBG._width, 0, ownX + moveX);
            _loc3 = ext_fscommand2("GetAudPlayTime");
            if (_loc3 != Math.floor(gTotalPlayTime * maskWidth / 100))
            {
                var _loc2;
                _loc2 = ext_fscommand2("KeyAudDirectSeek", Math.floor(gTotalPlayTime * maskWidth / 100));
                if (_loc2 != -1)
                {
                    gfn_Common_DrawSeekBar(MCSeekBar.MCSeekBG, this, MCSeekBar.MCSeekMask, maskWidth, SCROLL_HORIZONTAL);
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
        var _loc4 = this._xmouse;
        var _loc3;
        var _loc6;
        _loc3 = gfn_Common_GetSeekBarRatio(MCSeekBar.MCSeekBG._width, 0, _loc4);
        _loc6 = ext_fscommand2("GetAudPlayTime");
        if (_loc6 != Math.floor(gTotalPlayTime * _loc3 / 100))
        {
            var _loc5;
            _loc5 = ext_fscommand2("KeyAudDirectSeek", Math.floor(gTotalPlayTime * _loc3 / 100));
            if (_loc5 != -1)
            {
                gfn_Common_DrawSeekBar(MCSeekBar.MCSeekBG, MCSeekBar.MCSeeker, MCSeekBar.MCSeekMask, _loc3, SCROLL_HORIZONTAL);
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
		
		/*
        if (MCQuickList.MCQuickButton.sw == 2)
        {
            MCQuickList.MCQuickButton.onRelease();
        } // end if
        */
		this.gotoAndStop(1);
    } // end if
};
MCPopAdd.MCPopBt.onPress = MCPopAdd.MCBookmark.onPress = MCPopAdd.MCFavorite.onPress = function ()
{
    this.gotoAndStop(2);
};
MCPopAdd.MCPopBt.onDragOut = MCPopAdd.MCBookmark.onDragOut = MCPopAdd.MCFavorite.onDragOut = function ()
{
    this.gotoAndStop(1);
};
MCPopResult.onRelease = function ()
{
    _global.gfn_SetPopupMCName(null, 0);
};
MCPopAdd.MCBookmark.onRelease = function ()
{
    var _loc3;
    this.gotoAndStop(1);
    _loc3 = ext_fscommand2("KeyAudBookmark");
    if (_loc3 < 0)
    {
        MCPopResult.MCSuccess._visible = false;
        MCPopResult.MCFailure._visible = true;
        _global.gfn_SetPopupMCName(MCPopResult, 1);
        gfn_Common_SetTimer(1000, gfn_SetPopupMCName);
    }
    else
    {
        _global.gfn_SetPopupMCName(null, 0);
    } // end else if
};
MCPopAdd.MCFavorite.onRelease = function ()
{
    var _loc3;
    this.gotoAndStop(1);
    _loc3 = ext_fscommand2("KeyAudFavorite");
    if (_loc3 < 0)
    {
        MCPopResult.MCSuccess._visible = false;
        MCPopResult.MCFailure._visible = true;
        _global.gfn_SetPopupMCName(MCPopResult, 1);
        gfn_Common_SetTimer(1000, gfn_SetPopupMCName);
    }
    else
    {
        _global.gfn_SetPopupMCName(null, 0);
    } // end else if
};
MCPopAdd.MCPopBt.onRelease = function ()

{
    _global.gfn_SetPopupMCName(null, 0);
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
        _global.gfn_SetPopupMCName(MCPopPlayMode, 1);
		/*
        if (MCQuickList.MCQuickButton.sw == 2)
        {
            MCQuickList.MCQuickButton.onRelease();
        } // end if
		*/
        this.gotoAndStop(1);
    } // end if
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
        MCPlayInfo._visible = true;
        curJetPresetIndex = ext_fscommand2("GetJetEffectIndex");
        fn_SetEQPopupString(curJetPresetIndex);
        _global.gfn_SetPopupMCName(MCPopEqSet, 0);
        _global.gfn_Key_SetVirtualKeyMC(MCPopEqSet.MCPopEqTouch);
        fn_SetLyricState();
		/*
        if (MCQuickList.MCQuickButton.sw == 2)
        {
            MCQuickList.MCQuickButton.onRelease();
        } // end if
		*/
        this.gotoAndStop(1);
    } // end if
};
MCFooter.MCSideA.MCSetA.onPress = MCFooter.MCSideA.MCSetB.onPress = MCFooter.MCSideA.MCSetAB.onPress = function ()
{
    this.gotoAndStop(2);
};
MCFooter.MCSideA.MCSetA.onDragOut = MCFooter.MCSideA.MCSetB.onDragOut = MCFooter.MCSideA.MCSetAB.onDragOut = function ()
{
    this.gotoAndStop(1);
};
MCFooter.MCSideA.MCSetA.onRelease = MCFooter.MCSideA.MCSetB.onRelease = MCFooter.MCSideA.MCSetAB.onRelease = function ()
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
MCAlbumBG.onPress = function ()
{
    AlbumTouchGapX = this._xmouse;
    AlbumTouchGapY = this._ymouse;
};
MCAlbumBG.onRelease = function ()
{
    if (Math.abs(this._xmouse - AlbumTouchGapX) < 20 && Math.abs(this._ymouse - AlbumTouchGapY) < 20 && _global.gfn_GetPopupMCName() == null)
    {
        if (MCAlbumBG.MCCoverA._visible == true || MCAlbumBG.MCCoverA._visible == false && MCAlbumBG.MCCoverB._visible == false)
        {
            MCAlbumBG.MCCoverA._visible = false;
            MCAlbumBG.MCAlbumArt._visible = false;			
			MCAlbumBG.MCAlbumArtBG._visible = false;
            MCAlbumBG.MCCoverB._visible = true;
            fn_GetFileInfo();
        }
        else
        {
            if (gfCoverExist != 1)
            {
                MCAlbumBG.MCCoverA._visible = true;
            } // end if
			else
			{
				MCAlbumBG.MCAlbumArt._visible = true;
				MCAlbumBG.MCAlbumArtBG._visible = true;
			}
            MCAlbumBG.MCCoverB._visible = false;
        } // end if
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
    _global.gfn_Key_SetVirtualKeyMC(MCAlbumBG);
    fn_GetFileInfo();
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
};
MCPopAlbumMode.MCPopClose.onRelease = function ()
{
    _global.gfn_SetPopupMCName(null, 0);
};
MCPopEqSet.MCPopClose.onRelease = function ()
{
    _global.gfn_SetPopupMCName(null, 0);
    _global.gfn_Key_SetVirtualKeyMC(MCAlbumBG);
    fn_SetLyricState();
};
MCPopPlayMode.MCRepeatOff.onPress = MCPopPlayMode.MCRepeatOn.onPress = function ()
{
    this.gotoAndStop(2);
};
MCPopPlayMode.MCRepeatOff.onDragOut = MCPopPlayMode.MCRepeatOn.onDragOut = function ()
{
    this.gotoAndStop(1);
};
MCPopPlayMode.MCRepeatOff.onRelease = MCPopPlayMode.MCRepeatOn.onRelease = function ()
{
    this.gotoAndStop(1);
    ++g_PlayRepeat;
    if (g_PlayRepeat > 1)
    {
        g_PlayRepeat = 0;
    } // end if
    fn_SetRepeat(g_PlayRepeat, 1);
};
MCPopPlayMode.MCShuffleOn.onPress = MCPopPlayMode.MCShuffleOff.onPress = function ()
{
    this.gotoAndStop(2);
};
MCPopPlayMode.MCShuffleOn.onDragOut = MCPopPlayMode.MCShuffleOff.onDragOut = function ()
{
    this.gotoAndStop(1);
};
MCPopPlayMode.MCShuffleOn.onRelease = MCPopPlayMode.MCShuffleOff.onRelease = function ()
{
    this.gotoAndStop(1);
    ++g_PlayShuffle;
    if (g_PlayShuffle > 1)
    {
        g_PlayShuffle = 0;
    } // end if
    fn_SetShuffle(g_PlayShuffle, 1);
};
MCPopPlayMode.MCBoundaryAll.onPress = MCPopPlayMode.MCBoundaryFolder.onPress = MCPopPlayMode.MCBoundaryOne.onPress = function ()
{
    this.gotoAndStop(2);
};
MCPopPlayMode.MCBoundaryAll.onDragOut = MCPopPlayMode.MCBoundaryFolder.onDragOut = MCPopPlayMode.MCBoundaryOne.onDragOut = function ()
{
    this.gotoAndStop(1);
};
MCPopPlayMode.MCBoundaryAll.onRelease = MCPopPlayMode.MCBoundaryFolder.onRelease = MCPopPlayMode.MCBoundaryOne.onRelease = function ()
{
    this.gotoAndStop(1);
    ++g_PlayBoundary;
    if (g_PlayBoundary > 2)
    {
        g_PlayBoundary = 0;
    } // end if
    fn_SetBoundary(g_PlayBoundary, 1);
};

/* Flip 사용하지 않음
MCFooter.MCSideB.MCFlip.onRelease = MCFooter.MCSideA.MCFlip.onRelease = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        gfn_flipFooter(MCFooter.MCSideA, MCFooter.MCSideB, SCROLL_HORIZONTAL, 0);
        _root.FooterSide = _root.FooterSide ^ 1;
        _root.fn_Music_SaveData(0);
    } // end if
};
*/

MCHeader.ICGoList.onPress = MCHeader.MCGoTop.onPress = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(2);
    } // end if
};
MCHeader.MCGoTop.onDragOut = function ()
{
    if (_global.gfn_GetPopupMCName() == null)
    {
        this.gotoAndStop(1);
    } // end if
};
MCHeader.ICGoList.onDragOut = function ()
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
MCHeader.ICGoList.onRelease = function ()
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
MCHeader.MCGoTop.onRelease = function ()
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
MCPopDRM.MCPopBt.onRelease = MCPopMsg.MCPopBt.onRelease = function ()
{
    _global.gfn_SetPopupMCName(null, 0);
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
    this.gotoAndStop(1);
};
MCPopDRM.MCNo.onRelease = function ()
{
    ext_fscommand2("SetAudNedPlayState", 0);
    _global.gfn_SetPopupMCName(null, 0);
    this.gotoAndStop(1);
};

/*
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
                this._x = this._x + (-132 - this._x) * 5.000000E-001;
                if (Math.floor(this._x) < -131)
                {
                    delete this.onEnterFrame;
                } // end if
            } // end if
        };
    }
    else if (this.sw == 2)
    {
        this.sw = 1;
        _global.gfn_Key_SetVirtualKeyMC(MCAlbumBG);
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
*/
/*
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
*/


//이미지를 불러오기 위함, MC처리
var mcLoader:MovieClipLoader = new MovieClipLoader();
var TempObj:Object= new Object();

ControlBtn.onRelease = function ()
{
	if(MCFooterVisible)
	{
		MCFooterVisible = false;
		
		MCFooter._visible = MCFooterVisible;
		on_ani._visible = MCFooterVisible;
		this.controltext.text = "CONTROL OPEN";
		this.arrowtext.text = "▲";
		
		on_ani.gotoAndStop(1);
	}
	else
	{
		MCFooterVisible = true;
		
		MCFooter._visible = MCFooterVisible;
		on_ani._visible = MCFooterVisible;
		this.controltext.text = "CONTROL CLOSE";
		this.arrowtext.text = "▼";
		
		on_ani.gotoAndPlay(1);
	}
}

onUnload = function ()
{
    _root.fn_Music_SaveData(1);
    ext_fscommand2("SetAudLDBConfig", _root.ldbconfigOff);
    _global.gfn_SetPopupMCName(null, 0);
    fn_Destroy_Fr1();
};

function Load_Picture()
{
	mcLoader.loadClip("./system/Flash UI/music/back.jpg", this.back);	
	mcLoader.addListener(TempObj);
}

onUnload = function ()
{
    fn_DeleteVariable_Music();
    delete EQString;
    delete Origin_Y;
    delete Origin_Height;
};


TempObj.onLoadInit = function(mc:MovieClip)
{
	//var returnvalue:Boolean;
	
	//mc._x = -136;
	//mc._y = -240;
	mc._width = 272;
	mc._height = 480;
	
	//returnvalue = mcLoader.removeListener(TempObj);
	//delete mcLoader;
	//delete TempObj;
}

TempObj.onLoadError = function(mc:MovieClip, errorCode :String)
{
	//var returnvalue:Boolean;
	//returnvalue = 	mcLoader.removeListener(TempObj);
	//delete mcLoader;
	//delete TempObj;
}

Load_Picture();

stop ();

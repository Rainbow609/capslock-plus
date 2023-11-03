;-- 获取Excel、Outlook和Edge窗口的COM对象  By FeiYue
GetCOMObject(WinTitle)
{
    static h:=DllCall("LoadLibrary", "Str","oleacc", "Ptr")
    WinGet, list, ControlListHwnd, % WinTitle ? WinTitle : "A"
    For i,hWnd in StrSplit(list, "`n")
    {
        ControlGetPos, x, y, w, h,, ahk_id %hWnd%
        if (y<10 or w<100 or h<100)
            continue
        if DllCall("oleacc\AccessibleObjectFromWindow", "Ptr", hWnd
            , "UInt", 0xFFFFFFF0, "Ptr", 0*(VarSetCapacity(IID,16)
            +NumPut(0x0000000000020400,IID,"Int64")
            +NumPut(0x46000000000000C0,IID,8,"Int64"))+&IID, "Ptr*", pacc)=0
        {
            Acc:=ComObject(9, pacc, 1)
            Try
            {
                if (Acc.Application.Version)
                    return Acc.Application
            }
            Catch
            {
                continue
            }
        }
    }
    MsgBox, 4096,, Error: Can't Get Object From ACC !
    Exit
}

;-- 获取Excel窗口的COM对象
Excel_Get()
{
    return GetCOMObject("ahk_class XLMAIN")
}

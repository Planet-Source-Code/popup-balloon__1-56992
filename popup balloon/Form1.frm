VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Popup message"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Popup Message"
      Height          =   1215
      Left            =   1080
      TabIndex        =   0
      Top             =   480
      Width           =   2415
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Don't forget to Vote!"
      Height          =   375
      Left            =   600
      TabIndex        =   1
      Top             =   2280
      Width           =   3375
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub Command1_Click()

'Popup the balloon
Popup "This is a sample popup message!", "This is the Tittle of pop message"

End Sub

Private Sub Form_Load()

 'Starts System Tray
   With m_IconData
        .cbSize = Len(m_IconData)
        .hWnd = Me.hWnd
        .uID = vbNull
        .uFlags = NIF_ICON Or NIF_INFO Or NIF_MESSAGE 'Or NIF_TIP 'NIF_TIP Or NIF_MESSAGE
        .uCallbackMessage = WM_MOUSEMOVE
        .hIcon = Me.Icon
        .szTip = "Sample" & vbNullChar
        .dwState = 0
        .dwStateMask = 0
         End With
   Shell_NotifyIcon NIM_ADD, m_IconData
   
End Sub

Private Sub Form_Unload(Cancel As Integer)

'get rid of the icon in the system tray
 Shell_NotifyIcon NIM_DELETE, m_IconData
End Sub


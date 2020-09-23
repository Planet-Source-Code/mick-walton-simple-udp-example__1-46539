VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4650
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7500
   LinkTopic       =   "Form1"
   ScaleHeight     =   4650
   ScaleWidth      =   7500
   StartUpPosition =   3  'Windows Default
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   3360
      Top             =   1560
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.TextBox txtlog 
      Height          =   2415
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   8
      Top             =   2160
      Width           =   7215
   End
   Begin MSWinsockLib.Winsock sckudp 
      Left            =   6240
      Top             =   1440
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      Protocol        =   1
   End
   Begin VB.CommandButton Command2 
      Caption         =   "&Send"
      Height          =   375
      Left            =   120
      TabIndex        =   7
      Top             =   1560
      Width           =   1215
   End
   Begin VB.TextBox txtdata 
      Height          =   285
      Left            =   840
      TabIndex        =   5
      Top             =   1080
      Width           =   6615
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Connect"
      Height          =   375
      Left            =   3360
      TabIndex        =   4
      Top             =   240
      Width           =   1335
   End
   Begin VB.TextBox txtport 
      Height          =   285
      Left            =   840
      TabIndex        =   3
      Top             =   600
      Width           =   2055
   End
   Begin VB.TextBox txtip 
      Height          =   285
      Left            =   840
      TabIndex        =   2
      Top             =   240
      Width           =   2055
   End
   Begin VB.Label Label3 
      Caption         =   "Data:"
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   1080
      Width           =   735
   End
   Begin VB.Label Label2 
      Caption         =   "Port:"
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   600
      Width           =   1575
   End
   Begin VB.Label Label1 
      Caption         =   "IP:"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   1455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
If txtip.text = "" Then
Addtolog "No IP Specified"
ElseIf txtport.text = "" Then
Addtolog "No Port Specified"
Else

sckudp.RemoteHost = txtip.text
sckudp.RemotePort = txtport.text

'Winsock1.LocalPort = 6003
'Winsock1.Listen
End If
End Sub

Private Sub Command2_Click()
sckudp.SendData txtdata.text
Addtolog "Sent: " & txtdata.text
End Sub
Public Function Addtolog(text As String)
' Add a line to the text box
txtlog.text = txtlog.text + text & vbCrLf
End Function


VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmmain 
   Caption         =   "UDP server"
   ClientHeight    =   4035
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7335
   LinkTopic       =   "Form1"
   ScaleHeight     =   4035
   ScaleWidth      =   7335
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Stop"
      Height          =   375
      Left            =   1920
      TabIndex        =   3
      Top             =   3600
      Width           =   1695
   End
   Begin VB.CommandButton Command1 
      Caption         =   "&Start"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   3600
      Width           =   1695
   End
   Begin VB.TextBox txtdata 
      Height          =   2895
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   600
      Width           =   7095
   End
   Begin MSWinsockLib.Winsock sckudp 
      Left            =   6720
      Top             =   3600
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      Protocol        =   1
   End
   Begin VB.Label Label1 
      Caption         =   "Activity Log:"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   1095
   End
End
Attribute VB_Name = "frmmain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'UDP Example by Mick W,
'web: www.xcubed.co.uk
'email: mick@xcubed.co.uk


Private Sub Command1_Click()
' Start listening for connections, add to log
Addtolog "Started, listening on port 6003"

'Set local port  the socket should bind too

'In UDP protocol no active connections are made therefore the socket never needs
'to be in a 'listen' state, instead the socket is 'Binded' to a port so that
'It can recieve incomming data

'The port the socket will be binded too
sckudp.LocalPort = 6003

'Bind the socket
sckudp.Bind
Command1.Enabled = False
Command2.Enabled = True
End Sub

Public Function Addtolog(text As String)
' Add a line to the text box
txtdata.text = txtdata.text + text & vbCrLf
End Function

Private Sub Command2_Click()
' Sort out the buttons
Command1.Enabled = True
Command2.Enabled = False

'Close the UDP connection, will un-bind from the local port and stop recieving sata
sckudp.Close
Addtolog "Stopped, listening on port 6003"
End Sub


Private Sub Form_Load()
'Sort out the buttons
Command2.Enabled = False
sckudp.Close
End Sub

Private Sub sckudp_ConnectionRequest(ByVal requestID As Long)
Addtolog "Connection Requested: " & sckudp.RemoteHost & " " & sckudp.RemotePort
End Sub

Private Sub sckudp_DataArrival(ByVal bytesTotal As Long)
' Get incoming data
Dim data As String

'Gets data from the socket
sckudp.GetData data

Addtolog "Recieved: " & data
End Sub


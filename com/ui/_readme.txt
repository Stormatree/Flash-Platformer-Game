Movieclip UI Elements:
- Digit		(Uses movieclip frames)
- DigitGroup
- HealthBar	(Uses movieclip frames)
- Background
- Text		(Uses movieclip flags)


Menu States:

The UI class is what looks at the Main to decide what state to add / remove / update

The other classes are the various menu states triggered and removed from the UI class.
- Paused	(Can goto Restart and Playing)
- Playing	(Can goto Paused and Restart)
- Restart	(Can only goto playing)
- Start		(Can only goto Playing)
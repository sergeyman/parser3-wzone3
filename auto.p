# auto.p - 

@auto[]
$connect_string[mysql://root:@127.0.0.1/p3test]

@main[]
^header[]
^body[]
^footer[]

# navigation (1 ver.)
@navigation[]
$sections[^table::load[sections.cfg]]
<table width="100%" border="1">
	<tr>
	^sections.menu{
		<td align="center">
			<a href="$sections.uri"><nobr>$sections.name</nobr></a>
		</td>
	}
	</tr>
</table>

<br />

# navigation (21 ver.)
@navigation[]
$sections[^table::load[/sections.cfg]]
<table width="100%" border="1" bgcolor="#000000" cellspacing="1">
	<tr bgcolor="#FFFFFF">
	^sections.menu{
#		<td align="center">
#			<a href="$sections.uri"><nobr>$sections.name</nobr></a>
#		</td>
		^navigation_cell[]
	}
	</tr>
</table>
<br />

@navigation_cell[]
$cell_width[^eval(100\$sections)%]
^if($sections.uri eq $request:uri){
	<td width="$cell_width" align="center" bgcolor="#A2D0F2">
	<nobr>$sections.name</nobr>
	</td>
}{
	<td width="$cell_width" align="center">
	<a href="$sections.uri"><nobr>$sections.name</nobr></a>
	</td>
}

@header[]
<html>
<head>
<title>Тестовый сайт Parser3</title>
</head>
<body bgcolor="#FAEBD7">
<table width="100%" border="0" bgcolor="#000000" cellspacing="1">
	<tr bgcolor="#FFFFFF" height="60">
		<td align="center">
			<font size="+2"> <b>^greeting[]</b></font>
		</td>
	</tr>
</table>
<br />

@body[]
^navigation[]
<table width="100%" height="65%" border="0" bgcolor="#000000" cellspacing="1">
	<tr bgcolor="#ffffff" height="100%">
		<td width="30%" valign="top" bgcolor="#EFEFEF">
			<b>^body_additional[]</b>
		</td>
		<td width="70%" valign="top">
			^body_main[]
		</td>
	</tr>
</table>
<br />


@footer[]
<table width="100%" border="0" bgcolor="#000000" cellspacing="0">
	<tr>
		<td></td>
	</tr>
</table>
$now[^date::now[]]
<font size="-3">
<center>Powered by Parser3<br />1997-$now.year</center>
</font>
</body>
</html>
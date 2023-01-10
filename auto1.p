#Файл скриптов
@main[]
	$hp[^file::load[text;/hp.txt]]		

	Герой : 100 hp  
	<br />
	Монтср : $hp.text hp 							
	<br />
	<a href="/?cmd=attack">Атаковать</a>
	
#	^LAYOUT_ATTACK[]	# Вызов класса	'^CLASS[]'
	
@LAYOUT_ATTACK[]		# Создание класса	'@CLASS[]'
#	^if($form:cmd eq "attack") {			## parser.runtime ^if(0). Методу передано неправильное количество параметров или не тех типов, и т.п.
#		<br />
#		Монстр атакован

#		$step[^eval($hp.text - 10)]
#		^step.save[/hp.txt]
#	}


##############################################################################################################
#	$x, $x[y]							// vars				$connect_string[mysql://root@localhost/p3test]
#	@func[], ^func[]					// methods 1) create, override (virtual) 2) invoke
#	^class::consrtructor[params],		// class			$now[^date::now[]] - класс date c К. now для получения тек. даты
#	^obj.method[params]					// 					$sections[^table::load[sections.cfg]] - созд. об-та класса table
#															$days[^date:calendar[rus] ($now.year; $now.month)]
#															$days[^date:calendar[rus]($date.year; $date.month)] - стат. метод класса date
#															^connect[$connect_string]{
#																^void:sql{insert into news(date, header, body) values('$f:date', '$f:header', '$f:body')}
#															}
#															$var[^table::load[]]	
#															$var[^table::sql{SQL code}]
#															$var[^table.menu{}]
#
#
#	^sections.menu{}, <:random(10)>		// invoke <static> method	^sections.menu{ ^navigation_cell[]}
#																	^MAIN:dbconnect{ $msgs[^tabel::sql{select A, E,... from gbook}]}			
#	$sections.uri, .name, <:PI>			// get <static> field		$MAIN:field
#	$name[								// hash (assoc. array)
#		$.key[value]					// 					$calendar_locale[$.month_names[$.1[Jan] $.2[Feb]..]$.day_names[$.0[Mon]..]]
#	]

#	$name[^Clazz::method[				// ?
#		$.x[$a.b.c.1]
#		$.y[$a.b.c.2]
#		$.z[link]
#		$.xx[$a.e.f]
#	]]

#	@method[param1;param2][local_var1;local_var2]	
#	@method[param1;param2][loclas]		// all vars in body = locals
#
# 	^if(condition){...} {...}
#	^for[week_day](0;6) {...}

#	^MAIN:method[]						// ^MAIN:dbconnect
#	$MAIN:field

# 	@CLASS								// User class
#	class_name

#	@USE								// Parent class == another user class			
#	parent_class_file

#	@BASE								// Use another parent class methods/fields
#	parent_class_name

#	@load[]                 			// Constructor (create table on connecing to DB)
#	^MAIN:dbconnect{
#	    $messages[^table::sql{select author, email, date, body from gbook}]
#	}

#	@show_messages[]        			// Method to read and show messages from table created in load[]
#	^if($messages){
#	    ^messages.menu{...}

#	$instatnce[^class_name::constructor[]]			// instantiating class object
#	^instance.method1[]								// invoke its methods
#	^instance.method2[]





#	$var - объявление/вызов переменной
#	$parser_home_url[www.parser3.ru] - присвоение значения переменной
#	$sections[^table::load[sections.cfg]] - в переменной $sections хранится таблица из файла sections.cfg.
#	@ - определение метода (функция генерирующая фрагмент HTML-кода)
#	^ - вызов метода
#	Мы создали об. класса table с пом. конструктора load
#	^имя_класса::конструктор[параметры_конструктора] - создание объекта
#	^объект.метод_класса[параметры] - Синтаксис вызова методов объекта
#		^sections.menu - вызов метода перебора всех строк таблицы
#	$объект.имя_поля - получение значений полей объекта
#		$sections.uri
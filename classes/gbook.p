@CLASS
gbook

@load[]                 # Constructor (create table on connecing to DB)
^MAIN:dbconnect{
    $messages[^table::sql{select author, email, date, body from gbook}]
}

@show_messages[]        # Method to read and show messages from table created in load[]
^if($messages){
    ^messages.menu{
        <table width="100%">
            <tr>
            <td align="left"><b>$messages.author
                ^if(def $messages.email){
                    $messages.email
                }{
                    Нет электронного адреса
                }</b>
            </td>
            <td align="right">$messages.date</td>
            </tr>
        </table>
        <table width="100%">
        <tr>
            <td>$messages.body</td>
        </tr>
        </table>
    }[<table width="100%" border="0" bgcolor="000000" cellspacing="0">
        <tr><td>&nbsp^;</td></tr>
    </table>]
}{
    Гостевая книга пуста.
}

@show_form[]
<hr />
<br />
$date[^date::now[]]
<center>
<form method="POST">
<p>
    Author<sup>*</sup><input name="author" /><br />
    E-mail&nbsp;&nbsp;<input name="email" /><br />
    Text<br /><textarea cols="50" name="text" rows="5"></textarea>
</p>
<p>
<input type="submit" value="Send" name="post" />&nbsp;&nbsp;&nbsp;
<input type="reset" value="Cancel" />
</p>
</form>
</center>

@test_and_post_message[]      # M. check if post button is pressed, ... insert msg to db
^if(def $form:post){
    ^if(def $form:author){
        ^MAIN:dbconnect{
            ^void:sql{insert into gbook
                (author, email, date, body)
            values (
                '$form:author',
                '$form:email',
                '${date.year}-${date.month}-${date.day}',
                '$form:text'
            )}
        }
        $response:location[$request:uri]
    }{
        <center>Поле автор обязательно для заполнения</center>
    }
}
Create database ejemplo_login

use ejemplo_login

create table Usuario(
id int identity not null primary key,
username varchar(255),
clave binary(100)
)

go
Create function fun_encriptar(@valor varchar(255))
returns binary(100)
as
begin

declare @encriptado binary(100);

set @encriptado=HASHBYTES('SHAI',@valor);

return @encriptado;

end


insert into usuario values('user',(select dbo.fun_encriptar('miClave')));

select*from Usuario

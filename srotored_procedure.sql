-- Proced�rel yap�lar

declare @deger Varchar(20);
select @deger =count(Color)  from  Production.Product --where  ProductID<-1;

 

if @deger is not null
print 'Kay�t yok'
else
print  'Toplam' + cast(@deger as varchar)+ 'kayt bulundu'


---
select * from Production.Product


declare @deger1 int;
--set   @deger1=0;
select @deger1 =DaysToManufacture  from  Production.Product

if   @deger1=0
print 's�f�r'
else if @deger1=1
print 'bir'
else if @deger1=2
print '�c'
else if @deger1=4
print 'dort'
 


 --case yap�s�

 select  ProductNumber,Category= 
 case ProductLine  
   when 'R' then 'NormalKullan�m'  
   when 'M' then 'Dagkullanimi'
   when 'T' then 'GeziKulln�m�'
   when 'S' then 'Di�ersat�l�klar'

   else 'sat�l�kde�il'
 
  end,

  Name
  from Production.Product
  order by ProductNumber


  -- humanresources.employe -  erkek kad�n  --gender  M F 

  select   JobTitle,BirthDate,Gender ,Cisiyet =
  
  case   
  when Gender='M' then 'Erkek'
  when Gender='F' then 'Kad�n'
  end
      from HumanResources.Employee;


declare @say int 
set @say=0;

while  @say<=10
begin 
select '@say degeri :'+ CAST(@say as varchar(10))
select @say=@say+1

end;


begin 

waitfor delay '00:00:10';
select * from Production.Product
end;

---

--parametreli procedure
create procedure pr_UrunAra (@ProductNumber nvarchar(25))
as

set nocount on
if @ProductNumber  is not null

select  ProductID,ProductNumber,Name,ListPrice from Production.Product
where ProductNumber=@ProductNumber;
set nocount off

exec  pr_UrunAra  'BE-2349';



select * from Production.Product



create proc pr_hesapla(

@sayi1 int,
@sayi2 int,
@islem smallint,
@sonuc int output

) as

set nocount on

if @islem is not null 
if (@islem=0)
select @sonuc=(@sayi1+@sayi2);
else if (@islem=1)
select @sonuc=(@sayi1-@sayi2);
else if (@islem=2)
select @sonuc=(@sayi1*@sayi2);
else if (@islem=3)
select @sonuc=(@sayi1/@sayi2);
else 
select @sonuc=(0);

set nocount off



declare @sonuc int;

exec  pr_hesapla 7,5,2,@sonuc OUT;

select  '�arp�m:' as islem, @sonuc as sonuc


declare @sonuc int;

exec  pr_hesapla  @sayi1=7,@sayi2=10,@islem=1,@sonuc=@sonuc out;
select  '�arp�m:' as islem, @sonuc as sonuc


sp_helptext 'pr_hesapla' --procedure hakk�nda bilgi






select * from tab;

create table products
(product_id number,
 product_name varchar2(100),
 product_price number,
 product_cont varchar2(3000),
 product_img varchar2(100))
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
				
select nvl(max(product_id),0)+1 from products;								

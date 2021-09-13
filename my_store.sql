create database if not exists my_store;

use my_store;

create table if not exists stores(
  store_id int not null auto_increment,
  primary key(store_id)
) engine = InnoDB;

create table if not exists products(
  product_id int not null auto_increment,
  primary key(product_id),
  store_code int not null,
  constraint product_store_code foreign key(store_code) references stores(store_id)
) engine = InnoDb;

create table if not exists categories(
  category_id int not null auto_increment,
  primary key(category_id)
) engine = InnoDb;

create table if not exists brands(
  brand_id int not null auto_increment,
  primary key(brand_id),
  product_code int not null,
  constraint brand_product_code foreign key(product_code) references products(product_id)
) engine = InnoDb;

create table if not exists products_categories(
  products_product_id int not null auto_increment,
  categories_category_id int not null auto_increment,
  primary key(products_product_id, categories_category_id),
  constraint categories_product_category foreign key(categories_category_id) references products(product_id),
  constraint products_category_product foreign key(products_product_id) references categories(category_id)
) engine = InnoDb;

create table if not exists categories_brands(
  categories_category_id int not null auto_increment,
  brands_brand_id int not null,
  primary key (categories_category_id, brands_brand_id),
  constraint categories_brand_category foreign key (categories_category_id) references brands(brand_id),
  constraint brands_category_brand foreign key (brands_brand_id) references categories(category_id)
) engine = InnoDb;
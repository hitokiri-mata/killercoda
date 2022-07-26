
# Exploring the MySQL Server container

Start a bash shell into the msyql container

> `docker exec -it mysql bash`{{execute}}

Login to the mysql database server using the `wordpress` account.

> `mysql -u wordpress -p`{{execute}}

Input `12345` as password.

To show the databases, execute:

> `show databases;`{{execute}}

Change to the `wordpress` database. Execute:

> `use wordpress;`{{execute}}

To list all the tables, execute:

> `show full tables;`{{execute}}

**\*Note\***: You should first complete the installation of wordpress in the previous step to view the wordpress tables.

To describe and get data from the `wp_posts` table, execute:

> `describe wp_posts;`{{execute}}

> `select ID, post_title, post_author, post_date from wp_posts;`{{execute}}

Exit the mysql client.

> `exit`{{execute}}

Exit the `mysql` container.

> `exit`{{execute}}


--  Quastion 1
SELECT * FROM employees;
-- 
-- Quastion 2
SELECT COUNT(product_id) AS the_count_of_products FROM products;
-- 
--  Quastion 4
SELECT product_name AS expencie_product_of_supplier_2 
FROM products
WHERE supplier_id = 2
ORDER BY unit_price DESC
LIMIT 3;
-- 
-- Quastion 6
SELECT category_name
FROM categories
INNER JOIN
    (SELECT category_id, COUNT(product_id) AS number_of_product_per_category FROM products GROUP BY category_id)
    AS count_product_per_category
    ON count_product_per_category.number_of_product_per_category > 10 AND count_product_per_category.category_id = categories.category_id;
-- 
-- Quastion 8
SELECT  employees.first_name, employees.last_name, territories.territory_description
FROM employees
INNER JOIN employee_territories ON employees.employee_id = employee_territories.employee_id
INNER JOIN territories ON employee_territories.territory_id = territories.territory_id;
-- 
-- Quastion 9
SELECT employees.first_name, employees.last_name, count_orders_per_employee.amount_orders AS amount_of_orders
FROM employees
INNER JOIN (
    SELECT employee_id, COUNT(order_id) AS amount_orders
    FROM orders
    GROUP BY employee_id
    ) AS count_orders_per_employee
    ON count_orders_per_employee.employee_id = employees.employee_id
WHERE count_orders_per_employee.amount_orders > 100;
-- 

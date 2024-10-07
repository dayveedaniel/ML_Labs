-- SQLite

-- SELECT * from order_history

-- SELECT COUNT(DISTINCT product_id) AS some_alias FROM (SELECT * from order_busket LEFT join  products USING (product_id) GROUP BY order_busket.order_id);

SELECT 
    oh.order_id,
    oh.STATUS_ID,
    oh.store_id,
    oh.planned_prep_time,
    oh.DATE_CREATE as order_date_create,
    MAX(CASE WHEN op.NAME = 'region_id' THEN opv.VALUE END) AS region_id,
    MAX(CASE WHEN op.NAME = 'order_ready' THEN opv.VALUE END) AS order_ready,
    MAX(CASE WHEN op.NAME = 'order_start_prepare' THEN opv.VALUE END) AS order_start_prepare,
    MAX(CASE WHEN op.NAME = 'delivery_distance' THEN opv.VALUE END) AS delivery_distance,
    MAX(CASE WHEN op.NAME = 'profit' THEN opv.VALUE END) AS profit,
    MAX(CASE WHEN op.NAME = 'order_pickup' THEN opv.VALUE END) AS order_pickup,
    COUNT(DISTINCT ob.product_id) AS product_count,
    SUM(ob.price) AS total_price
    -- GROUP_CONCAT( CAST(p.product_id AS VARCHAR), ', ') AS product_ids,
    -- GROUP_CONCAT( CAST(p.date_create AS VARCHAR), ', ') AS product_create_dates
FROM 
    order_history oh
LEFT JOIN order_props_value opv ON oh.order_id = opv.order_id
LEFT JOIN order_props op ON opv.ORDER_PROPS_ID = op.ID
LEFT JOIN order_busket ob ON oh.order_id = ob.order_id
LEFT JOIN products p ON ob.product_id = p.product_id AND oh.store_id = p.store_id
GROUP BY 
    oh.order_id, oh.STATUS_ID, oh.store_id, oh.planned_prep_time, oh.DATE_CREATE
ORDER BY 
    oh.order_id
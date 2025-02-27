-- Perbandingan Pendapatan Kimia Farma dari Tahun ke Tahun
SELECT 
    EXTRACT(YEAR FROM DATE(date)) AS year, 
    SUM(nett_sales) AS total_nett_sales
FROM `kimia_farma.kf_analysis`
GROUP BY year
ORDER BY year ASC;

-- Top 10 Total Transaksi Cabang Provinsi
SELECT 
    provinsi, 
    COUNT(transaction_id) AS total_transactions
FROM `kimia_farma.kf_analysis`
GROUP BY provinsi
ORDER BY total_transactions DESC
LIMIT 10;

-- Top 10 Nett Sales Cabang Provinsi
SELECT 
    provinsi, 
    SUM(nett_sales) AS total_nett_sales
FROM `kimia_farma.kf_analysis`
GROUP BY provinsi
ORDER BY total_nett_sales DESC
LIMIT 10;

-- Top 5 Cabang Dengan Rating Tertinggi, Namun Rating Transaksi Terendah
SELECT 
    branch_name, 
    kota,
    provinsi,
    ROUND(AVG(rating_cabang),2) AS avg_rating_cabang,
    ROUND(AVG(rating_transaksi),2) AS avg_rating_transaksi
FROM `kimia_farma.kf_analysis`
GROUP BY branch_name, kota, provinsi
HAVING AVG(rating_cabang) >= 4.5
ORDER BY avg_rating_transaksi ASC
LIMIT 5;
const mysql = require('mysql2/promise');
const bikinkoneksi = async () => {
    return await mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '',
        database: 'whatsapp'
    })
}
const getbuku = async (tahun) => {
    const connection = await bikinkoneksi();
    let sql = "SELECT * FROM buku WHERE Tahun_Terbit = '"+ tahun +"'";
    const [rows] = await connection.execute(sql);
    if (rows.length > 0){
        return rows;
    }else{
        return false;
    }
}
const getnomor = async (keyword) => {
    const connection = await bikinkoneksi();
    let sql = "SELECT a.no_telp, b.nama AS anggota, b.jenis_kelamin, c.nama AS grup FROM telp AS a JOIN anggota AS b ON a.id_anggota = b.id JOIN grup AS c ON a.id_grup = c.id WHERE a.id_grup IN ('"+ keyword +"') AND a.status_aktif = 'Y' AND b.status_aktif = 'Y' ORDER BY b.nama";
    const [rows] = await connection.execute(sql);
    if (rows.length > 0){
        return rows;
    }else{
        return false;
    }
}
module.exports = {
    bikinkoneksi, getbuku, getnomor
}


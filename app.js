console.log("Ini Project NodeJS Pertama Saya");
function sekarang(){
    daftar = ["Jan","Feb","Mar","Apr","Mei","Jun","Jul","Agu","Sep","Okt","Nov","Des"];
    date = new Date();
    detik = date.getSeconds();
    menit = date.getMinutes();
    jam = date.getHours();
    tgl = date.getDate();
    bln = date.getMonth();
    th = date.getFullYear();
    return tgl + " " + daftar[bln] + " " + th + " " + jam + ":" + menit + ":" + detik;
}
console.log("Saat ini: " + sekarang());
const {Client, LocalAuth, MessageMedia, Buttons, List} = require('whatsapp-web.js');
// const {Buttons} = require('whatsapp-web.js/src/structures');
const qrcode = require('qrcode-terminal');
const express = require("express");
const cors = require("cors");
const wa = new Client({puppeteer: {headless: true}, authStrategy: new LocalAuth()});
const db = require('./db.js');
const app = express();
app.use(express.json());
app.use(express.urlencoded({extended: true}));
let opsi = {
    origin: '*',
    optionsSuccessStatus: 200,
    methods: "GET, POST"
}
app.use(cors(opsi));

wa.on('qr', (token) => {
    console.log(token);
    qrcode.generate(token, {small: true});
});
wa.on('ready', () => {
    console.log('Whatsapp Siap !');
});
wa.on('authenticated', () => {
    console.log('Akun Siap !');
});
wa.on('message', async msg => {
    // console.log(msg);
    let pesan = msg.body.toLocaleLowerCase();
    let nomor = msg.from;
    let nama = msg._data.notifyName;
    console.log("Pengirim ", nama, nomor, pesan);
    if(nomor.includes("@c")){
        if(pesan == "info"){

            // let button = new Buttons('Button body', [{ body: 'Aceptar' }, { body: 'rechazar' }], 'title', 'footer');
            // msg.reply(button);
            // const productsList = new List(
            //     "Here's our list of products at 50% off",
            //     "View all products",
            //     [
            //       {
            //         title: "Products list",
            //         rows: [
            //           { id: "apple", title: "Apple" },
            //           { id: "mango", title: "Mango" },
            //           { id: "banana", title: "Banana" },
            //         ],
            //       },
            //     ],
            //     "Please select a product"
            // );
            // wa.sendMessage(nomor, productsList);
        }else{

        }
    //         msg.reply("Silahkan Ketik dengan Format buku#tahun. Contoh: buku#2014");
    //     }else if(pesan.includes("#")){
    //         let xy = pesan.split("#");
    //         let kriteria = xy[0];
    //         let nilai = xy[1];
    //         if(kriteria == "buku" && nilai != ""){
    //             const dt = await db.getbuku(nilai);
    //             if(dt != false){
    //                 let respon = "";
    //                 let no = 0;
    //                 for(x in dt){
    //                     no++;
    //                     respon += no + ". " + dt[x].Judul + "\n";
    //                 }
    //                 msg.reply(respon);
    //             }else{
    //                 msg.reply("Data Buku untuk Tahun " + nilai + " Tidak Ada/Kosong");
    //             }
    //         }else{
    //             msg.reply("Format salah, Silahkan ketik info untuk melihat format yang tersedia");
    //         }
    //     }else{
    //         msg.reply("Format Salah, Silahkan ketik info untuk melihat format benar");
    //     }
    }else{
        console.log("Tidak Perlu Respon");
    }
});

wa.initialize();

// mengirim pesan melalui WhatsApp (japri)
app.post("/kirimpesan", (req, res) => {
    const nomor = req.body.nomor;
    const pesan = req.body.pesan;
    wa.sendMessage(nomor + "@c.us", pesan).then(response => {
        res.status(200).json({
            nomor: nomor,
            status: "Pesan Berhasil di Kirim"
        });
        console.log("Pesan Berhasil di Kirim Ke " + nomor);
    }).catch(err => {
        res.status(500).json({
            nomor: nomor,
            status: "Pesan Gagal di Kirim, " + err
        });
        console.log("Pesan Gagal: " + err);
    })
});


// mengirim pesan melalui WhatsApp (grup) 
app.post("/kirimpesan2", (req, res) => {
    const nomor = req.body.nomor;
    const pesan = req.body.pesan;
    const grupId = "120363159427491427@g.us"; // Menggunakan "@g.us" untuk grup

    wa.sendMessage(grupId, pesan)
        .then(() => {
            res.status(200).json({
                nomor: nomor,
                status: "Pesan Berhasil di Kirim"
            });
            console.log("Pesan Berhasil di Kirim Ke " + nomor);
        })
        .catch(err => {
            res.status(500).json({
                nomor: nomor,
                status: "Pesan Gagal di Kirim, " + err.message
            });
            console.log("Pesan Gagal: " + err.message);
        });
});


// destructuring assignment pada const { nomor, pesan } = req.body; untuk menguraikan nilai req.body.nomor menjadi variabel nomor dan req.body.pesan menjadi variabel pesan. Dengan demikian, kita dapat mengakses nilai-nilai tersebut secara langsung melalui variabel yang sudah diuraikan 
// app.post("/kirimpesan2", (req, res) => {
//     const { nomor, pesan } = req.body;
//     const grupId = nomor + "@g.us"; // Menggunakan "@g.us" untuk grup

//     wa.sendMessage(grupId, pesan)
//         .then(() => {
//             res.status(200).json({
//                 nomor: nomor,
//                 status: "Pesan Berhasil di Kirim"
//             });
//             console.log("Pesan Berhasil di Kirim Ke " + nomor);
//         })
//         .catch(err => {
//             res.status(500).json({
//                 nomor: nomor,
//                 status: "Pesan Gagal di Kirim, " + err.message
//             });
//             console.log("Pesan Gagal: " + err.message);
//         });
// });


// pengiriman pesan massal melalui WhatsApp ke beberapa nomor secara berurutan dengan jeda waktu antar pengiriman
app.post("/kirimblast", (req, res) => {
    const massal = req.body.nomor;
    const pesan = req.body.pesan;
    let nomor = massal.split(",");
    let jml = nomor.length;
    var urut = 0;
    let i = setInterval(function(){
        wa.sendMessage(nomor[urut] + "@c.us", pesan).then(response => {
            console.log("Pesan Berhasil di Kirim Ke " + nomor[urut]);
            urut++;
        }).catch(err => {
            console.log("Pesan Gagal: " + err);
            urut++;
        });
        if(urut === (jml - 1)) {
            clearInterval(i);
        }
    }, 20000);
});

// pengiriman media (gambar) melalui WhatsApp ke nomor yang ditentukan, dengan opsi untuk menyertakan caption pada media yang dikirim
app.post("/kirimmedia", (req, res) => {
    const nomor = req.body.nomor;
    const gambar = req.body.gambar;
    const caption = req.body.caption;
    const media = new MessageMedia('image/png', gambar);
    wa.sendMessage(nomor + "@c.us", media, {caption: caption}).then(response => {
        console.log("Gambar Berhasil di Kirim Ke " + nomor);
    }).catch(err => {
        console.log("Gambar Gagal: " + err);
    });
});

// mengirim pesan secara massal melalui WhatsApp
let xpecah;
let xjml;
let xurut;
let xmin;
let xmax;
let xpesan;
app.post("/kirimblast1", (req, res) => {
    let isi = req.body.isi;
    xpesan = req.body.pesan;
    res.status(200).json({
        status: true,
        status: "Data Telah di Terima dan Diproses lebih lanjut"
    });
    if(isi.includes(",")){
        xpecah = isi.split(",");
        xjml = xpecah.length;
        xurut = 0; xmin = 10; xmax = 20;
        xkirimpesan();
    }else{
        let datakecil = isi.split("|");
        let nomor = datakecil[0];
        let nama = datakecil[1];
        let jk = datakecil[2];
        let grup = datakecil[3];
        let sebutan = jk == "L" ? "Saudara" : "Saudari";
        let pesankirim = "Yang Terhormat " + sebutan + " " + nama + ",\n" + xpesan;
        wa.sendMessage(nomor + "@c.us", pesankirim).then(response => {
            console.log("Pesan Berhasil di Kirim Ke " + nama + " (" + grup + ")");
        }).catch(err => {
            console.log("Pesan Gagal di Kirim Ke " + nama + ", Error: " + err);
        });
    }
});

// mengirim pesan massal ke beberapa nomor dengan jeda waktu antara pengiriman pesan ke nomor berikutnya
function xkirimpesan(){
    var angka = Math.floor(Math.random() * (xmax - xmin + 1) + xmin);
    let datakecil = xpecah[xurut].split("|");
    let nomor = datakecil[0];
    let nama = datakecil[1];
    let jk = datakecil[2];
    let grup = datakecil[3];
    let sebutan = jk == "L" ? "Saudara" : "Saudari";
    let pesankirim = "Yang Terhormat " + sebutan + " " + nama + ",\n" + xpesan;
    wa.sendMessage(nomor + "@c.us", pesankirim).then(response => {
        console.log("Pesan Berhasil di Kirim Ke " + nama + " (" + grup + ")", angka + " Detik Lagi");
        xurut++;
    }).catch(err => {
        console.log("Pesan Gagal di Kirim Ke " + nama + ", Error: " + err, angka + " Detik Lagi");
        xurut++;
    });
    if(xurut < (xjml-1)) {
        setTimeout(xkirimpesan, angka * 1000);   
    }
};

// mengambil nomor-nomor yang terkait dengan data yang diterima, dan kemudian mengirim pesan massal ke nomor-nomor tersebut
app.post("/kirimblast2", async (req, res) => {
    const isi = req.body.isi;
    const pesan = req.body.pesan;
    res.status(200).json({
        status: true,
        status: "Data Telah di Terima dan Diproses lebih lanjut"
    });
    let dtx;
    if(isi.includes(",")){
        let keyword = isi.replace(",","','");
        dtx = await db.getnomor(keyword);
    }else{
        dtx = await db.getnomor(isi);
    }
    if(dtx != false){
        let namas = [];
        let telps = [];
        let jks = [];
        let grups = [];
        for(z of dtx){
            namas.push(z.anggota);
            telps.push(z.no_telp);
            jks.push(z.jenis_kelamin);
            grups.push(z.grup);
        }
        let jml = telps.length;
        let urut = 0;
        let i = setInterval(function(){
            let sebutan = jks[urut] == "L" ? "Saudara" : "Saudari";
            let pesankirim = "Yang Terhormat " + sebutan + " " + namas[urut] + ",\n" + pesan;
            // console.log(namas[urut], grups[urut]);
            // urut++;
            wa.sendMessage(telps[urut] + "@c.us", pesankirim).then(response => {
                console.log("Pesan Berhasil di Kirim Ke " + namas[urut] + " (" + grups[urut] + ")");
                urut++;
            }).catch(err => {
                console.log("Pesan Gagal di Kirim Ke " + namas[urut] + ", Error: " + err);
                urut++;
            });
            if(urut === (jml - 1)) {
                clearInterval(i);
            }
        }, 15000);
    }else{
        console.log("Tidak No Telp")
    }
});

app.listen(7200, function(){
    console.log("Whatsapp Berjalan di Port: " + 7200);
});
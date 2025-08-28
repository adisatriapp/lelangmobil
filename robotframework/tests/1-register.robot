*** Settings ***
Documentation    Registration flow validates user can register successfully
Resource    ../resources/imports.resource




*** Test Cases ***
Register with valid credentials
    [Documentation]    End-to-end registration using valid personal and payment data
    GIVEN The user is on the Registration page - Data Diri tab
    WHEN The user fills all "Nama Depan" with value    ${namaDepan}
    AND The user fills all "Nama Belakang" with value    ${namaBelakang}
    AND Fill "Tempat Lahir" with value    ${tempatLahir}
    AND Fill "Tanggal Lahir" with value    ${tanggalLahir}
    AND Fill Nomor KTP with value    ${noKTP}
    AND Upload KTP
    AND Fill "Masa Berlaku KTP" with value
    AND Choose "Kewarganegaraan" as WNI
    AND Fill "Provinsi" with value    ${provinsi}
    AND Fill "Kota" with value     ${kota}
    AND Fill "Alamat Domisili" with value     ${alamatDomisili}
    AND Fill "Nomor Telepon" with value     ${noTelp}
    AND Choose "Pekerjaan" as     ${pekerjaan}
    AND Fill "Nama Perusahaan" with value     ${namaPerusahaan}
    AND Fill "Alamat perusahaan" with value     ${alamatPerusahaan}
    AND Fill "Nomor Telepon Perusahaan" with value     ${noTelpPerusahaan}
    AND Choose NPWP as "Tidak Ada"
    AND Choose "Jenis Kendaraan" as     ${jenisKendaraan}
    AND Choose "Kendaraan yang dicari" as     ${kendaraanDiCari}
    AND Choose "Tujuan Pembelian" as     ${tujuanPembelian}
    AND Fill email with value     ${data_email_qa}
    AND Fill "Kata sandi" and "Konfirmasi" with value     ${data_pass_qa}
    AND The user clicks "Selanjutnya"
    AND Fill "Nomor rekening" with value     ${noRek}
    AND Choose "Bank" as     ${bank}
    AND Fill "Nama pemilik rekening" with value     ${namaPemilikBank}
    AND Choose Sumber dana as     ${sumberDana}
    AND Choose "metode pembayaran" as     ${metodeBayar}
    AND Click “Daftar”
    THEN The Data inputs are saved and email validation is sended
    AND User will redirect to login page

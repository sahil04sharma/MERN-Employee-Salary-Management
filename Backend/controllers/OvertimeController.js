import db from "../config/Database.js";

// CREATE OVERTIME
export const createOvertime = async (req, res) => {
  const { id_pegawai, tanggal, jam_lembur, alasan } = req.body;

  // ✅ 1. Required fields
  if (!id_pegawai || !tanggal || !jam_lembur || !alasan) {
    return res.status(400).json({ msg: "Semua field wajib diisi" });
  }

  // ✅ 2. Hours validation (1–6)
  if (jam_lembur < 1 || jam_lembur > 6) {
    return res.status(400).json({ msg: "Jam lembur harus antara 1–6 jam" });
  }

  // ✅ 3. Date validation
  const today = new Date();
  const inputDate = new Date(tanggal);

  if (inputDate > today) {
    return res.status(400).json({ msg: "Tanggal tidak boleh di masa depan" });
  }

  const pastLimit = new Date();
  pastLimit.setDate(today.getDate() - 7);

  if (inputDate < pastLimit) {
    return res.status(400).json({ msg: "Maksimal input 7 hari ke belakang" });
  }

  // ✅ 4. Reason length
  if (alasan.length < 10) {
    return res.status(400).json({ msg: "Alasan minimal 10 karakter" });
  }

  try {
    // ✅ 5. Duplicate check
    const [duplicate] = await db.query(
      "SELECT * FROM data_overtime WHERE id_pegawai = ? AND tanggal = ?",
      {
        replacements: [id_pegawai, tanggal],
      }
    );

    if (duplicate.length > 0) {
      return res.status(400).json({ msg: "Data lembur sudah ada untuk tanggal ini" });
    }

    // ✅ 6. Monthly limit check (60 hrs)
    const [monthly] = await db.query(
      "SELECT SUM(jam_lembur) as total FROM data_overtime WHERE id_pegawai = ? AND MONTH(tanggal) = MONTH(?)",
      {
        replacements: [id_pegawai, tanggal],
      }
    );

    const total = monthly[0].total || 0;

    if (total + jam_lembur > 60) {
      return res.status(400).json({ msg: "Melebihi batas 60 jam per bulan" });
    }

    // ✅ INSERT
    await db.query(
      "INSERT INTO data_overtime (id_pegawai, tanggal, jam_lembur, alasan, createdAt, updatedAt) VALUES (?, ?, ?, ?, NOW(), NOW())",
      {
        replacements: [id_pegawai, tanggal, jam_lembur, alasan],
      }
    );

    res.status(200).json({ msg: "Lembur berhasil ditambahkan" });

  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};
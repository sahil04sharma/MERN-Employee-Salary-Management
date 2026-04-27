import { useState } from "react";
import Layout from "../../../../layout";
import { Breadcrumb } from "../../../../components";
import axios from "axios";
import Swal from "sweetalert2";

const DataOvertime = () => {
  const [form, setForm] = useState({
    id_pegawai: "",
    tanggal: "",
    jam_lembur: "",
    alasan: ""
  });

  const handleChange = (e) => {
    setForm({
      ...form,
      [e.target.name]: e.target.value
    });
  };

  const handleSubmit = async () => {
    try {
      // ✅ frontend validation
      if (!form.id_pegawai || !form.tanggal || !form.jam_lembur || !form.alasan) {
        return Swal.fire("Error", "Semua field wajib diisi", "error");
      }

      if (form.jam_lembur < 1 || form.jam_lembur > 6) {
        return Swal.fire("Error", "Jam lembur harus 1-6", "error");
      }

      if (form.alasan.length < 10) {
        return Swal.fire("Error", "Alasan minimal 10 karakter", "error");
      }

      await axios.post("http://localhost:5000/data_overtime", form, {
        withCredentials: true
      });

      Swal.fire("Success", "Lembur berhasil ditambahkan", "success");

      setForm({
        id_pegawai: "",
        tanggal: "",
        jam_lembur: "",
        alasan: ""
      });

    } catch (error) {
      Swal.fire("Error", error.response?.data?.msg || "Terjadi kesalahan", "error");
    }
  };

  return (
    <Layout>
      <Breadcrumb pageName="Data Overtime" />

      <div className="mt-6 rounded-sm border border-stroke bg-white px-5 pt-6 pb-5 shadow-default dark:border-strokedark dark:bg-boxdark">

        <div className="grid grid-cols-1 gap-4 md:grid-cols-2">

          <input
            type="number"
            name="id_pegawai"
            placeholder="ID Pegawai"
            value={form.id_pegawai}
            onChange={handleChange}
            className="border p-2 rounded"
          />

          <input
            type="date"
            name="tanggal"
            value={form.tanggal}
            onChange={handleChange}
            className="border p-2 rounded"
          />

          <input
            type="number"
            name="jam_lembur"
            placeholder="Jam Lembur (1-6)"
            value={form.jam_lembur}
            onChange={handleChange}
            className="border p-2 rounded"
          />

          <input
            type="text"
            name="alasan"
            placeholder="Alasan"
            value={form.alasan}
            onChange={handleChange}
            className="border p-2 rounded"
          />

        </div>

        <div className="mt-4">
          <button
            onClick={handleSubmit}
            className="bg-primary text-white px-4 py-2 rounded hover:bg-opacity-90"
          >
            Submit
          </button>
        </div>

      </div>
    </Layout>
  );
};

export default DataOvertime;
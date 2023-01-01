<!DOCTYPE html>
<html>
<head>
	<title>Laporan Data Jabatan - Pixel Salary</title>
	<!-- <link rel="shortcut icon" href="Assets/IMG/Favicon.png" type="image/x-icon"> -->
	<style type="text/css">
	body{
		font-family: Arial;
	}

	@media print{
		.no-print
		{
			display: none;
		}

		body{
			font-family: Arial;
		}

	}

	table{
		border-collapse: collapse;
	}
</style>
</head>
<body id='data'>

	<!-- SETTING  -->
	<form action="" method="GET" class="no-print">
		<select name="bulan" required>
			<option value="" disabled selected>Pilih Bulan</option>
			<option value="01">Januari</option>
			<option value="02">Februari</option>
			<option value="03">Maret</option>
			<option value="04">April</option>
			<option value="05">Mei</option>
			<option value="06">Juni</option>
			<option value="07">Juli</option>
			<option value="08">Agustus</option>
			<option value="09">September</option>
			<option value="10">Oktober</option>
			<option value="11">November</option>
			<option value="12">Desember</option>
		</select>
		<select name="tahun" required>
			<option value="" disabled selected>Pilih Tahun</option>
			<?php
			$y = date('Y');
			for ($i=2019; $i <= $y+2 ; $i++) { 
				echo "
				<option value='$i'>$i</option>
				";
			}
			?>
		</select>
		<input type="submit" value="Filter Data">
	</form>

	<form action="" method="GET" class="no-print">
		<input type="submit" value="Tampil semua data">
	</form>
	
	<?php include('function.php');?>

	<h3 align="center">PT. PIXEL SALARY<br>DAFTAR JABATAN</h3>
	<hr>
	<?php
	if ((isset($_GET['bulan']) && $_GET['bulan']!='') && (isset($_GET['tahun']) && $_GET['tahun']!='')) 
	{
		$bulan_ket = bulanIDN($_GET['bulan']);
		$bulan = $_GET['bulan'];
		$tahun = $_GET['tahun'];
	}
	else
	{
		$bulan_ket = "Semua Bulan";
		$tahun = "Semua Tahun";
	}
	?>

	<table>
		<tr>
			<td>Bulan</td>
			<td>:</td>
			<td><?php echo $bulan_ket; ?></td>
		</tr>
		<tr>
			<td>Tahun</td>
			<td>:</td>
			<td><?php echo $tahun; ?></td>
		</tr>
	</table>
	

	<table border="1" cellpadding="4" cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>No</th>
				<th>Kode Jabatan</th>
				<th>Nama Jabatan</th>
				<th>Gaji Pokok</th>
				<th>Tunjangan Jabatan</th>
				<th>Potongan Sakit</th>
				<th>Potongan Izin</th>
				<th>Potongan Alpha</th>
			</tr>
		</thead>
		<tbody>
			<?php
			if (!isset($_GET['bulan']) || !isset($_GET['tahun']) || $_GET['bulan'] == '' || $_GET['tahun'] == ''){
				$sql = "SELECT * FROM jabatan ORDER BY kode_jabatan ASC";

				$query = $this->db->query($sql)->result_array();	
			}else{
				$sql = "SELECT * FROM jabatan WHERE bulan='$bulan' AND tahun='$tahun' ORDER BY kode_jabatan ASC";	

				$query = $this->db->query($sql)->result_array();
			}

			$no=1;

			if (count($query) == 0) {
				echo"
				<tr>
				<td colspan='8' align='center'>Tidak ada data yang ditambahkan</td>
				</tr>
				";
			}

			foreach ($query as $d) {

				$gaji_pokok = buatRP($d['gaji_pokok']);
				$tunjangan_jabatan = buatRP($d['tunjangan_jabatan']);
				$potongan_sakit = buatRP($d['potongan_sakit']);
				$potongan_izin = buatRP($d['potongan_izin']);
				$potongan_alpha = buatRP($d['potongan_alpha']);
				$bulan_ket = bulanIDN($d['bulan']);

				echo "<tr>
				<td width='40px' align='center'>$no</td>
				<td>$d[kode_jabatan]</td>
				<td>$d[nama_jabatan]</td>
				<td>$gaji_pokok</td>
				<td>$tunjangan_jabatan</td>
				<td>$potongan_sakit</td>
				<td>$potongan_izin</td>
				<td>$potongan_alpha</td>
				</tr>";
				$no++;

			}
			?>
		</tbody>
	</table>

	<table width="100%">
		<tr>
			<td><a href="#" class="no-print" onclick="window.print();">Cetak/Print</a><br>
			</td>
			<td width="200px">
				<p>PIXEL SALARY, <?php echo tglIDN(date("Y-m-d")); ?><br>________________,</p>
				<br>
				<br>
				<br>
				<p>_______________________</p>
			</td>
		</tr>
	</table>
</body>
</html>
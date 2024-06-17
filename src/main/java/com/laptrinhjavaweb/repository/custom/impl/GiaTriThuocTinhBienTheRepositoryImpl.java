package com.laptrinhjavaweb.repository.custom.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Repository;

import com.laptrinhjavaweb.repository.custom.GiaTriThuocTinhBienTheRepositoryCustom;
import com.laptrinhjavaweb.utils.ConnectionUtils;

@Repository
public class GiaTriThuocTinhBienTheRepositoryImpl implements GiaTriThuocTinhBienTheRepositoryCustom {
	@Override
	public Long findBienThe(List<Long> giaTriThuocTinhs) {
		List<Long> bienThes= new ArrayList<>();
		String query = buildQuery(giaTriThuocTinhs);
		try (Connection conn = ConnectionUtils.getConection();
			 Statement stmt = conn.createStatement();
			 ResultSet rs = stmt.executeQuery(query);) {
			while (rs.next()) {
				Long bienTheId = rs.getLong("idbienthe");
				bienThes.add(bienTheId);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(bienThes.isEmpty() || bienThes.size() > 1){
			return null;
		}
		return bienThes.get(0);
	}

	private String buildQuery(List<Long> giaTriThuocTinhsId) {
		List<String> giaTriThuocTinhs = new ArrayList<>();
		String add = "";
		if(giaTriThuocTinhsId.size() > 1){
			add = " AND t2.idgiatrithuoctinh <> t1.idgiatrithuoctinh ";
		}
		for (Long item : giaTriThuocTinhsId) {
			giaTriThuocTinhs.add(String.valueOf(item));
		}
		String results = giaTriThuocTinhs.stream().map(item -> item).collect(Collectors.joining(" , ", "(", ")"));
		String query = "SELECT t1.idbienthe" +
				" FROM giatrithuoctinhbienthe AS t1 " +
				" WHERE idgiatrithuoctinh IN " + results + " AND " +
				" t1.idbienthe IN (" +
				" SELECT t2.idbienthe " +
				" FROM giatrithuoctinhbienthe AS t2 " +
				" WHERE t2.idgiatrithuoctinh IN " + results + " AND " +
				" t2.idbienthe = t1.idbienthe" + add +
				" )" +
				" GROUP BY t1.idbienthe" +
				" HAVING COUNT(t1.idbienthe) >= " + giaTriThuocTinhsId.size();
		return query;
	}
}

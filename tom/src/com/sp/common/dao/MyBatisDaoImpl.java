package com.sp.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dao")
public class MyBatisDaoImpl implements CommonDAO {
	@Autowired
	private SqlSession sqlSession;
	
/*	
	public void setSqlSessionTemplate(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
*/
	
	// ******************************************************************
	// ������ �߰�
    public int insertData(String id, Object value) throws Exception {
    	int result = 0;

		try {
			result = sqlSession.insert(id, value);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		} finally {
		}
		return result;
    }
    
	// ******************************************************************
	// ������ ����
    public int updateData(String id, Object value) throws Exception {
		int result = 0;
		
		try {
	   	    result = sqlSession.update(id, value);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}
		
		return result;
    }
    public int updateData(String id, Map<String, Object> map) throws Exception {
		int result = 0;
		
		try {
	   	    result = sqlSession.update(id, map);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}
		
		return result;
    }
    
	// ******************************************************************
	// ������ ����
	public int deleteData(String id, Map<String, Object> map) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete(id, map);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}

		return result;
    }
	public int deleteData(String id, Object value) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete(id, value);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}

		return result;
    }
	public int deleteAll(String id) throws Exception {
		int result = 0;
		
		try {
	    	result = sqlSession.delete(id);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}

		return result;
    }

	// ******************************************************************
	// �� �ڵ� �� / �ִ� �� ���ϱ�
	public int getIntValue(String id, Map<String, Object> map) throws Exception {
		int num = 0;
 
		try {
			num = ((Integer)sqlSession.selectOne(id, map)).intValue();
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}		

		return num;
    }
	public int getIntValue(String id, Object value) throws Exception {
		int num = 0;
		
		try {
			num = ((Integer)sqlSession.selectOne(id, value)).intValue();
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}		
		
		return num;
    }
	public int getIntValue(String id) throws Exception {
		int num = 0;
		try {
			num = ((Integer)sqlSession.selectOne(id)).intValue();
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}		
		return num;
    }
	
	// ******************************************************************
	// ���̺��� �ϳ� �̻��� ���ڵ带 SELECT
	public <T> List<T> getListData(String id, Map<String, Object> map) throws Exception {
		List<T> list = null;
		try {
			list = sqlSession.selectList(id, map);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}		
		return list;
	}
	public <T> List<T> getListData(String id, Object value) throws Exception {
		List<T> list = null;
		try {
			list = sqlSession.selectList(id, value);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}		
		return list;
	
	}
	public <T> List<T> getListData(String id) throws Exception {
		List<T> list = null;
		try {
			list = sqlSession.selectList(id);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}		
		return list;
	}
	
	// ******************************************************************
	// ���̺��� �ϳ��� ���ڵ带 SELECT
	public <T> T getReadData(String id) throws Exception {
		try {
			return  sqlSession.selectOne(id);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}		
	}
	public <T> T getReadData(String id, Object value) throws Exception {
		try {
			return  sqlSession.selectOne(id, value);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}		
	}
	public <T> T getReadData(String id, Map<String, Object> map) throws Exception {
		try {
			return  sqlSession.selectOne(id, map);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}		
	}
	
	// ******************************************************************
	// ���ν���
	// INSERT, UPDATE, DELETE
	@Override
	public void callUpdateProcedure(String id, Object value) throws Exception{
		try {
			sqlSession.update(id, value);
		} catch (Exception e) {
			System.out.println(e.toString());
			
			throw e;
		}
	}

	// SELECT : OUT �Ķ���Ͱ� SYS_REFCURSOR �̿��� �ϳ��� ���ڵ�(INTEGER ��)
	@Override
	public <T> Map<String, T> callSelectOneProcedureMap(String id, Map<String, T> map) throws Exception{
		try {
			// select procedure ����� map�� �����Ѵ�.
			sqlSession.selectOne(id, map);
			return map;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return map;
	}
	
	// SELECT : OUT �Ķ���Ͱ� SYS_REFCURSOR(�ϳ� �Ǵ� �ϳ� �̻��� ���ڵ�)
	public <T> Map<String, T> callSelectListProcedureMap(String id, Map<String, T> map) throws Exception{
		try {
			// select procedure ����� map�� �����Ѵ�.
			sqlSession.selectList(id, map);
			return map;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return map;
	}
}

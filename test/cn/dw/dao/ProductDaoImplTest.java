package cn.dw.dao;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.dw.model.Category;
import cn.dw.model.Product;
import cn.dw.service.ProductServiceImpl;

public class ProductDaoImplTest {

	// static说明当前属性是类属性,只有一份,静态方法只能操作静态属性
	private static ProductServiceImpl serviceImpl = null;
	private static ApplicationContext context = null;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		System.out.println("setUpBeforeClass.....");
		context = new ClassPathXmlApplicationContext("spring-public.xml");
		// daoImpl = (ProductDaoImpl)context.getBean("productDao");
		serviceImpl = context.getBean("productService", ProductServiceImpl.class);
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		System.out.println("tearDownAfterClass.....");
		serviceImpl = null;
	}

	@Test
	public void testQueryByName() {
		// "%%":代表查询所有记录
		List<Product> proList = serviceImpl.queryByName("", 1, 2);
		for (Product temp : proList) {
			System.out.println(temp);
		}
	}

	//
	@Test
	public void testGetById() {
		// "%%":代表查询所有记录
		System.out.println(serviceImpl.getById(2));
	}

	@Test
	public void cacheTest() throws InterruptedException {
		serviceImpl.getById(1);   // 0.0         
		serviceImpl.getById(1);   // 0.5
		serviceImpl.getById(1);   // 0.666
		serviceImpl.getById(2);   // 0.5
		serviceImpl.getById(3);   // 0.4  ==> 1
		serviceImpl.getById(1);   // 	
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	public void testSave() {
		Product product = new Product();
		product.setName("联想笔记本电脑");
		product.setPrice(6999.00);
		product.setRemark("remark");
		// 指定当前商品的类别
		Category category = new Category();
		category.setId(1);
		product.setCategory(category);
		serviceImpl.save(product);
	}

}











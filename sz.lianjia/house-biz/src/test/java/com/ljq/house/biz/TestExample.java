package com.ljq.house.biz;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * @Author: ljq
 * @Date: 18-12-26 下午7:23
 */
public class TestExample extends TestCase {

    public TestExample(String testName )
    {
        super( testName );
    }


    public static Test suite()
    {
        return new TestSuite( TestExample.class );
    }

    public void test()
    {
        assertTrue( true );
    }
}

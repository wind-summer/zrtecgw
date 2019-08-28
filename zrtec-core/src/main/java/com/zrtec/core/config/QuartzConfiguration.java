package com.zrtec.core.config;

import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.Properties;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * <p>
 *  定时任务配置
 * </p>
 *
 * @author wenlongfei
 * @since 2019/5/6
 */
@Configuration
public class QuartzConfiguration {

    //@Bean
    public Scheduler scheduler() throws IOException, SchedulerException {
        SchedulerFactory schedulerFactory = new StdSchedulerFactory(quartzProperties());
        Scheduler scheduler = schedulerFactory.getScheduler();
        scheduler.start();
        return scheduler;
    }

    //@Bean
    public Properties quartzProperties() throws IOException {
//        Properties prop = new Properties();
//        prop.put("org.quartz.scheduler.instanceName", "MyselfScheduler");
//        prop.put("org.quartz.scheduler.instanceId", "");
//        prop.put("org.quartz.scheduler.skipUpdateCheck", "");
//        prop.put("org.quartz.scheduler.jobFactory.class", "");
//        prop.put("org.quartz.jobStore.class", "");
//        prop.put("org.quartz.jobStore.driverDelegateClass", "");
//        prop.put("org.quartz.jobStore.dataSource", "");
//        prop.put("org.quartz.jobStore.tablePrefix", "");
//        prop.put("org.quartz.jobStore.isClustered", "");
//        prop.put("org.quartz.threadPool.class", "");
//        prop.put("org.quartz.threadPool.threadCount", "");
//        prop.put("org.quartz.dataSource.quartzDataSource.connectionProvider.class", "");
//        prop.put("org.quartz.dataSource.quartzDataSource.driver", "");
//        prop.put("org.quartz.dataSource.quartzDataSource.URL", "");
//        prop.put("org.quartz.dataSource.quartzDataSource.user", "");
//        prop.put("org.quartz.dataSource.quartzDataSource.password", "");
//        prop.put("org.quartz.dataSource.quartzDataSource.maxConnections", "");


        //quartz参数
        Properties prop = new Properties();
        prop.put("org.quartz.scheduler.instanceName", "MyselfScheduler");
        prop.put("org.quartz.scheduler.instanceId", "AUTO");
        //配置
        prop.put("org.quartz.threadPool.class", "org.quartz.simpl.SimpleThreadPool");
        prop.put("org.quartz.threadPool.threadCount", "20");
        prop.put("org.quartz.threadPool.threadPriority", "5");
        //JobStore配置
        prop.put("org.quartz.jobStore.class", "org.quartz.impl.jdbcjobstore.JobStoreTX");
        //集群配置
        prop.put("org.quartz.jobStore.isClustered", "true");
        prop.put("org.quartz.jobStore.clusterCheckinInterval", "15000");
        prop.put("org.quartz.jobStore.maxMisfiresToHandleAtATime", "1");

        prop.put("org.quartz.jobStore.misfireThreshold", "12000");
        prop.put("org.quartz.jobStore.tablePrefix", "QRTZ_");
        return prop;
    }

    @Bean
    public SchedulerFactoryBean schedulerFactoryBean(DataSource dataSource) {
        SchedulerFactoryBean factory = new SchedulerFactoryBean();
        factory.setDataSource(dataSource);

        //quartz参数
        Properties prop = new Properties();
        prop.put("org.quartz.scheduler.instanceName", "SyScheduler");
        prop.put("org.quartz.scheduler.instanceId", "AUTO");
        //线程池配置
        prop.put("org.quartz.threadPool.class", "org.quartz.simpl.SimpleThreadPool");
        prop.put("org.quartz.threadPool.threadCount", "20");
        prop.put("org.quartz.threadPool.threadPriority", "5");
        //JobStore配置
        prop.put("org.quartz.jobStore.class", "org.quartz.impl.jdbcjobstore.JobStoreTX");
        //集群配置
        prop.put("org.quartz.jobStore.isClustered", "true");
        prop.put("org.quartz.jobStore.clusterCheckinInterval", "15000");
        prop.put("org.quartz.jobStore.maxMisfiresToHandleAtATime", "1");

        prop.put("org.quartz.jobStore.misfireThreshold", "12000");
        prop.put("org.quartz.jobStore.tablePrefix", "QRTZ_");
        factory.setQuartzProperties(prop);

        factory.setSchedulerName("SyScheduler");
        //延时启动
        factory.setStartupDelay(30);
        factory.setApplicationContextSchedulerContextKey("applicationContextKey");
        //可选，QuartzScheduler 启动时更新己存在的Job，这样就不用每次修改targetObject后删除qrtz_job_details表对应记录了
        factory.setOverwriteExistingJobs(true);
        //设置自动启动，默认为true
        factory.setAutoStartup(true);

        return factory;
    }

    public void test() throws Exception{
        /*fixedThreadPool创建线程池*/

        ExecutorService fixedThreadPool = Executors.newFixedThreadPool(3);
        for (int i = 0; i < 10; i++) {
            final int index = i;
            fixedThreadPool.execute(() -> {
                System.out.println(index);
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            });
        }

    }

    public void test1() throws Exception{
//        new ThreadPoolExecutor(1, 5,  0L, TimeUnit.MILLISECONDS,
//                new LinkedBlockingQueue<Runnable>(),
//                threadFactory);
//        new ThreadPoolExecutor(5, 10,
//                0L, TimeUnit.MILLISECONDS,
//                new LinkedBlockingQueue<Runnable>());
        //ScheduledExecutorService executorService = new ScheduledThreadPollExecutor(1, new zrtecThreadFactory)

//        List<? extends Number> foo3 = new ArrayList<>();
//        Number n = 1;
//        foo3.add(n);
//        Object i = foo3.get(0);
//
//        List<? super Integer> foo4 = new ArrayList<>();
//        foo4.add(1);
//        Integer 1 = foo4.get(0);

    }
}

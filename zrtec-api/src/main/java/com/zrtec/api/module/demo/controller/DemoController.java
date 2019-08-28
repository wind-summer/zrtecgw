package com.zrtec.api.module.demo.controller;

import com.zrtec.core.annotation.SysLog;
import com.zrtec.core.module.demo.entity.Demo;
import com.zrtec.core.module.demo.service.DemoService;
import com.zrtec.core.mvc.controller.AbstractApiResultController;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * demo表 前端控制器
 * </p>
 *
 * @author wenlongfei
 * @since 2018-09-26
 */
@RestController
@RequestMapping("/demo")
@Slf4j
@AllArgsConstructor
@Api(description = "DEMO示例")
public class DemoController extends AbstractApiResultController {

    private final DemoService demoService;

    @SysLog("Demo方法test执行")
    @GetMapping("/test")
    @Transactional(rollbackFor = Exception.class)
    public String test(){
        /*stateMachine.start();
        stateMachine.sendEvent(OrderEvents.PAY);
        stateMachine.sendEvent(OrderEvents.SHIPPING);*/

        Demo demo = Demo.builder()
                .age(12)
                .name("马六")
                .remark("..")
                .build();
        demoService.insert(demo);

        //String str = "2j";
        //Integer i = Integer.valueOf(str);

        /*Demo demo = demoService.selectById(1);
        MyEvent event = new MyEvent(demo);
        SpringContextUtils.applicationContext.publishEvent(event);
        SysUser user = CurrentUserUtils.getLogin();
        valueOperations.set("name","张三");
        List<Demo> demos = demoService.selectList(new EntityWrapper<Demo>().eq("id", 1L));

        String test = "1s";
        Integer.valueOf(test);*/

        log.info("好这个是demo 的测试方法：test");
        return "sssss";
    }
}


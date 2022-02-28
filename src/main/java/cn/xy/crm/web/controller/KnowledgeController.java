package cn.xy.crm.web.controller;

import cn.xy.crm.domain.KnowledgeMenu;
import cn.xy.crm.service.IKnowledgeMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 客户知识库
 * @author
 */
@Controller
public class KnowledgeController {
    @Autowired
    private IKnowledgeMenuService knowledgeMenuService;

    //界面
    @RequestMapping("/knowledge")
    public String index() {
        return "knowledge";

    }

    //菜单列表
    @RequestMapping("/knowledgeMenu")
    @ResponseBody
    public List<KnowledgeMenu> list() {
        List<KnowledgeMenu> result = null;
        result = knowledgeMenuService.queryKnowledgeMenu();
        return result;
    }


}

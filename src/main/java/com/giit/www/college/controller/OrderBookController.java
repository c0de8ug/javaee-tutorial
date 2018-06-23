package com.giit.www.college.controller;

import com.giit.www.college.service.OrderBookBiz;
import com.giit.www.entity.Section;
import com.giit.www.entity.custom.ChangedItems;
import com.giit.www.entity.custom.OrderBookReviewVo;
import com.giit.www.entity.custom.OrderBookVo;
import com.giit.www.util.TermContainer;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by c0de8ug on 16-2-13.
 */
//TODO URL我自己定义全小写
@Controller
@RequestMapping("orderbook.do")

public class OrderBookController {
    @Resource(name = "orderBookBizImpl")
    private OrderBookBiz orderBookBiz;

    @RequiresRoles(value = {"admin", "teacher"}, logical = Logical.OR)
    @RequestMapping("orderbook.view")
    public String orderBookView(Model m, HttpSession httpSession) {
        String staffId = (String) httpSession.getAttribute("username");

        List<Section> sectionList = orderBookBiz.findSelectedSection(staffId, TermContainer.now());
        int courseCount = sectionList.size();
        m.addAttribute("selectedSectionList", sectionList);
        m.addAttribute("courseCount", courseCount);
        return "/teacher/orderbook";
    }

    @RequiresRoles(value = {"admin", "teacher"}, logical = Logical.OR)
    @RequestMapping("orderbook_review.view")
    public String orderBookReviewView(Model m, HttpSession session) {
        //TODO 放到SESSION方便处理
        session.setAttribute("notReviewedBookList", orderBookBiz.findAllNotReviewedBook());
        return "/teacher/orderbook_review";
    }

    @RequiresRoles(value = {"admin", "teacher"}, logical = Logical.OR)
    @RequestMapping("orderbook_add.view")
    public String orderBookAddView(Model m) {
        return "/teacher/orderbook_add";
    }

    @RequiresRoles(value = {"admin", "teacher"}, logical = Logical.OR)
    @RequestMapping("orderbook_added.view")
    public String orderBookAddedView(Model m, HttpSession session) {
        String staffId = (String) session.getAttribute("username");
        m.addAttribute("addedBookInfoList", orderBookBiz.findAddedBookInfoList(staffId));
        return "/teacher/orderbook_added";
    }

    @RequiresRoles(value = {"admin", "teacher"}, logical = Logical.OR)
    @RequestMapping("add")
    public String add(HttpServletRequest request, HttpSession session) {
        Map map = request.getParameterMap();
        OrderBookVo orderBookVo = new OrderBookVo();
        orderBookVo.setStaffId((String) session.getAttribute("username"));
        orderBookVo.setMap(map);
        orderBookBiz.add(orderBookVo);
        return "redirect:/orderbook.do/orderbook.view";
    }

    @RequiresRoles(value = {"admin", "teacher"}, logical = Logical.OR)
    @RequestMapping("update")
    @ResponseStatus(value = HttpStatus.OK)
    public void update(@RequestBody ChangedItems changedItems, HttpSession session) {
        orderBookBiz.update(changedItems, (String) session.getAttribute("username"));
    }

    @RequiresRoles(value = {"admin", "teacher"}, logical = Logical.OR)
    @RequestMapping("audit")
    public String audit(HttpSession session) {
        List<OrderBookReviewVo> orderBookReviewVoList = (List<OrderBookReviewVo>) session.getAttribute("notReviewedBookList");
        orderBookBiz.audit(orderBookReviewVoList);
        return "redirect:/orderbook.do/orderbook_review.view";
    }
}

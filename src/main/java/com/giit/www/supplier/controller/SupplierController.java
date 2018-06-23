package com.giit.www.supplier.controller;

import com.giit.www.supplier.service.SupplierBiz;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by c0de8ug on 16-2-16.
 */

@Controller

@RequestMapping("supplier.do")
public class SupplierController {

    @Resource(name = "supplierBizImpl")
    SupplierBiz supplierBiz;

    @RequiresRoles(value = {"admin", "supplier"}, logical = Logical.OR)
    @RequestMapping("supplier.view")
    public String supplierView(Model m) {
        m.addAttribute("reviewedBookList", supplierBiz.findAllReviewedBook());
        return "/supplier/supplier";
    }
}

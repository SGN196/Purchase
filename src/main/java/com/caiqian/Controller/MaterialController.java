package com.caiqian.Controller;

import com.caiqian.Bean.MaterialCategory;
import com.caiqian.Bean.MaterialInfo;
import com.caiqian.Bean.MaterialRecord;
import com.caiqian.Bean.UserInfo;
import com.caiqian.DTO.MaterialInfoDTO;
import com.caiqian.DTO.UpdateMaterialDTO;
import com.caiqian.Service.MaterialService;
import com.caiqian.Service.RecordService;
import com.github.abel533.echarts.Option;
import com.github.abel533.echarts.axis.CategoryAxis;
import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.code.Magic;
import com.github.abel533.echarts.code.Tool;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.feature.MagicType;
import com.github.abel533.echarts.json.GsonOption;
import com.github.abel533.echarts.series.Line;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

/**
 * @author SGN196
 * @date 2019/3/4 18:57
 */

@Controller
@RequestMapping("/material")
public class MaterialController
{

    @Autowired
    MaterialService materialService;

    @Autowired
    RecordService recordService;

    public static Integer materialId;

    @RequestMapping("/list/{id}")
    public String list(@PathVariable("id") Integer id, HttpServletRequest request, HttpServletResponse response, Model model)
    {
        materialId = id;
        return "common/echarts";
    }

    @ResponseBody
    @RequestMapping("/option")
    public String getOption(Model model, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse)
    {

        httpServletResponse.setContentType("text/html;charset=utf-8");
        MaterialInfo materialInfo = materialService.queryMaterialById(materialId);
        int[][] nums = recordService.queryByMaterialId(materialInfo.getId(), 49);
        Calendar cal = Calendar.getInstance();
        String[] str = new String[7];
        for (int i = 0; i < 7; i++)
        {
            str[i] = new SimpleDateFormat("yyyy-MM-dd ").format(cal.getTime());
            cal.add(Calendar.DATE, -7);
        }


        Option option = new GsonOption();
        option.title("                                                                                                                         " + materialInfo.getMaterialName() + "库存及进出库情况", "纯属虚构");
        option.tooltip().trigger(Trigger.axis);
        option.legend("入库", "出库", "库存");
        option.toolbox().show(true).feature(Tool.mark,
                Tool.dataView,
                new MagicType(Magic.line, Magic.bar, Magic.stack, Magic.tiled),
                Tool.restore,
                Tool.saveAsImage).padding(50);
        option.calculable(true);

        //得到当前日期


        option.xAxis(new CategoryAxis().boundaryGap(false).data(str[6], str[5], str[4], str[3], str[2], str[1], str[0]));
        option.yAxis(new ValueAxis());

        Line l1 = new Line("入库");
        l1.smooth(true).itemStyle().normal().areaStyle().typeDefault();
        l1.data(nums[0][0], nums[0][1], nums[0][2], nums[0][3], nums[0][4], nums[0][5], nums[0][6]);

        Line l2 = new Line("出库");
        l2.smooth(true).itemStyle().normal().areaStyle().typeDefault();
        l2.data(nums[1][0], nums[1][1], nums[1][2], nums[1][3], nums[1][4], nums[1][5], nums[1][6]);

        Line l3 = new Line("库存");
        l3.smooth(true).itemStyle().normal().areaStyle().typeDefault();
        l3.data(nums[2][0], nums[2][1], nums[2][2], nums[2][3], nums[2][4], nums[2][5], nums[2][6]);

        option.series(l1, l2, l3);
        return option.toString();
    }


    @RequestMapping("/toUpdateMaterial/{MaterialId}")
    public String toUpdateMaterial(@PathVariable("MaterialId") Integer id, HttpSession session, Model model)
    {
        UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
        if (userInfo == null)
        {
            return "emp/login";
        }
        boolean isAuthority = recordService.isAccessAuthorityRecordOfEmployee(userInfo.getDeptId());
        if (!isAuthority)
        {
            return "material/repertoryList";
        }

        UpdateMaterialDTO updateMaterialDTO = materialService.queryByIdToUpdateDTO(id);
        List<MaterialCategory> levelOneList = materialService.queryLevelOne();
        model.addAttribute("updateMaterialDTO", updateMaterialDTO);
        model.addAttribute("levelOneList", levelOneList);

        return "category/updateMaterial";
    }

    @RequestMapping("/toDeleteMaterial/{MaterialId}")
    public String toDeleteMaterial(@PathVariable("MaterialId") Integer id, MaterialInfoDTO materialInfoDTO, HttpSession session, Model model)
    {
        UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
        if (userInfo == null)
        {
            return "emp/login";
        }
        boolean isAuthority = recordService.isAccessAuthorityRecordOfEmployee(userInfo.getDeptId());
        if (!isAuthority)
        {
            return "material/repertoryList";
        }
        Boolean flag = materialService.deleteById(id);
        List<MaterialCategory> levelOneList = materialService.queryLevelOne();
        model.addAttribute("materialInfoDTO", materialInfoDTO);
        model.addAttribute("levelOneList", levelOneList);
        return "material/repertoryList";
    }

    @RequestMapping("/updateMaterial")
    public String UpdateMaterial(UpdateMaterialDTO updateMaterialDTO, Model model)
    {

        if (updateMaterialDTO.isEmptyUpdate())
        {
            model.addAttribute("ErrUpdateMaterialMsg", "关键数据为空");
        } else
        {
            boolean flag = materialService.updateMaterialInfoDTO(updateMaterialDTO);
            if (flag == true)
            {
                model.addAttribute("updateMaterialMsg", "修改成功");
            } else
            {
                model.addAttribute("ErrUpdateMaterialMsg", "修改失败");
            }

        }
        List<MaterialCategory> levelOneList = materialService.queryLevelOne();
        model.addAttribute("levelOneList", levelOneList);
        model.addAttribute("updateMaterialDTO", updateMaterialDTO);
        return "category/updateMaterial";

    }

    @RequestMapping("/toAddMaterial")
    public String toAddMaterial(Model model, HttpSession httpSession)
    {
        UserInfo userInfo = (UserInfo) httpSession.getAttribute("userInfo");
        if (userInfo == null)
        {
            return "emp/login";
        }
        List<MaterialCategory> levelOnex = materialService.queryLevelOne();
        model.addAttribute("levelOnex", levelOnex);
        return "category/addMaterial";
    }


    @RequestMapping("/addMaterial")
    public String addMaterial(MaterialInfo materialInfoObj, HttpSession httpSession, Model model)
    {
        UserInfo userInfo = (UserInfo) httpSession.getAttribute("userInfo");
        if (userInfo == null)
        {
            return "emp/login";
        }
        //判断数据库中，是否存在该商品信息
        boolean exist = materialService.isExistByName(materialInfoObj);
        if (exist)
        {
            model.addAttribute("addMaterialMsg", "");
            model.addAttribute("ErraddMaterialMsg", "该材料已存在");
            return "category/addMaterial";
        }

        List<MaterialCategory> levelOnex = materialService.queryLevelOne();
        model.addAttribute("levelOnex", levelOnex);
        if (!materialInfoObj.isEmptyADD())
        {
            materialInfoObj.setCreateBy(userInfo.getId());
            boolean flag = materialService.addMaterialItem(materialInfoObj);
            if (flag)
            {
                model.addAttribute("addMaterialMsg", "新增成功");
                model.addAttribute("ErraddMaterialMsg", "");
                return "category/addMaterial";
            } else
            {
                model.addAttribute("ErraddMaterialMsg", "新增失败");
                model.addAttribute("addMaterialMsg", "");
            }
        } else
        {
            model.addAttribute("ErraddMaterialMsg", "信息填写未填全");
            model.addAttribute("addMaterialMsg", "");

        }
        model.addAttribute("materialInfoTemp", materialInfoObj);
        return "category/addMaterial";
    }

    //判断登录的员工账号，是否有权限访问库存信息
    @RequestMapping("/repertoryList")
    public String repertoryList(MaterialInfoDTO materialInfoDTO, HttpSession httpSession, Model model)
    {
        UserInfo userInfo = (UserInfo) httpSession.getAttribute("userInfo");
        if (userInfo == null)
        {
            return "emp/login";
        }
        boolean isAuthority = materialService.isAccessAuthorityRepertoryOfEmployee(userInfo.getDeptId());
        if (isAuthority)
        {
            if (materialInfoDTO.getPageNum() == null)
            {
                materialInfoDTO.setPageNum(1);
            }
            PageInfo<MaterialInfo> pageInfo = materialService.query(materialInfoDTO);
            List<MaterialCategory> levelOneList = materialService.queryLevelOne();


            model.addAttribute("page", pageInfo);
            model.addAttribute("levelOneList", levelOneList);
            model.addAttribute("materialInfoDTO", materialInfoDTO);

            return "category/index";
        } else
        {
            model.addAttribute("PermissionDenied", "权限不足，无法访问");
            return "emp/index";
        }

    }

    @ResponseBody
    @RequestMapping("/category/queryLevelTwoByLevelOne/{levelId}")
    public List<MaterialCategory> queryLevelTwoByLevelOne(@PathVariable("levelId") Integer id)
    {
        List<MaterialCategory> list = materialService.queryLevelTwoByLevelOne(id);
        return list;
    }

    @ResponseBody
    @RequestMapping("/category/queryMaterialNameByLevelTwo/{levelTwoId}")
    public List<MaterialInfo> queryMaterialNameByLevelTwo(@PathVariable("levelTwoId") Integer id)
    {
        List<MaterialInfo> list = materialService.queryMaterialNameByLevelTwo(id);
        return list;
    }


    @ResponseBody
    @RequestMapping("/category/queryUnitById/{Id}")
    public String queryUnitById(@PathVariable("Id") Integer id)
    {

        String str = materialService.queryUnitById(id);
        return str;
    }


}

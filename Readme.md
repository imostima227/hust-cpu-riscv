## 项目说明

RISC-V 5段流水线CPU的设计

- 支持32位RISC-V指令集和CCAB扩展指令
- 支持单级中断、多级嵌套中断和流水线中断
- 支持5段流水机制，可处理数据冲突、结构冲突、分支冲突

项目中logisim平台支持以上所有功能，FPGA只支持单周期CPU

## 运行说明

环境依赖：logisim 2.15.0.2，Vivado 2015.2

logisim文件夹中的文件可以用logisim直接打开。FPGA中的文件需要安装好vivado后打开该目录下的single_cycle_cpu.xpr文件。

相关网站：[自己动手画CPU: 自己动手画CPU实验框架 (gitee.com)](https://gitee.com/totalcontrol/hustzc?_from=gitee_search)
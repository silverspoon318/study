## @RequestMapping에서 Get방식과 Post방식

1. Get방식
@RequestMapping(method = RequestMethod.GET)

2. Post방식
@RequestMapping(method = RequestMethod.POST)

## @ModelAttribute
@ModelAttribute 어노테이션을 이용하면 커맨드 객체의 이름을 개발자가 변경 할 수 있습니다.

@RequestMapping("/studentView")
public String studentView(StudentInformation studentInformation) {
    return "studentView";    
}

@RequestMapping("/studentView")
publc String studentView(@ModelAttribute("studentInfo") StudentInformation studentInformation) {
    return "studentView";
}

## 리다이렉트 redirect: 키워드
다른 페이지로 이동할 때 사용합니다.
retrun "redirect:studentOk";

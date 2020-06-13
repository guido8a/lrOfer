package janus

class DescargasController extends janus.seguridad.Shield {

    def manual() {
        def filePath = "Manual oferentes.pdf"
        def path = servletContext.getRealPath("/") + File.separatorChar + filePath
        def file = new File(path)
        def b = file.getBytes()
        response.setContentType('pdf')
        response.setHeader("Content-disposition", "attachment; filename=" + filePath)
        response.setContentLength(b.length)
        response.getOutputStream().write(b)
    }


} //fin controller

package relatorios;

import java.util.logging.Logger;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import util.Minir;

public class RelatorioGenerico {

    private static final Logger logger = Logger.getLogger(RelatorioGenerico.class.getName());

    
    public RelatorioGenerico() {
        
    }

    public void Gerar(List lista, String nomerelatorio, HttpServletResponse response) throws IOException {

        String relatorio_jrxml = "fontesjasper/"+nomerelatorio+".jrxml";

        try {
            InputStream jrxmlInput = this.getClass().getClassLoader().getResource(relatorio_jrxml).openStream();
            JasperDesign design = JRXmlLoader.load(jrxmlInput);
            JasperReport jasperReport = JasperCompileManager.compileReport(design);
            JRBeanCollectionDataSource valuesToReport = new JRBeanCollectionDataSource(lista);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, new HashMap(), valuesToReport);
            JRPdfExporter pdfExporter = new JRPdfExporter();
            pdfExporter.setExporterInput(new SimpleExporterInput(jasperPrint));
            ByteArrayOutputStream pdfReportStream = new ByteArrayOutputStream();
            pdfExporter.setExporterOutput(new SimpleOutputStreamExporterOutput(pdfReportStream));
            pdfExporter.exportReport();
            response.reset();
            response.setContentType("application/pdf");
            response.setHeader("Content-Length", String.valueOf(pdfReportStream.size()));
            response.addHeader("Content-Disposition", "attachment; filename="+nomerelatorio+".pdf;");
            try (OutputStream responseOutputStream = response.getOutputStream()) {
                responseOutputStream.write(pdfReportStream.toByteArray());
                responseOutputStream.flush();
                responseOutputStream.close();
            }
        } catch (JRException e) {
            logger.info(e.getMessage());
        }
    }

    

}

#------------------------------------------------------------------------------
# Codigo para geracao de provas e correcao dos resultados
#
# Equipe MAT02219-EAD 2019/1
#
# Passo a passo para correcao:
# 1. criar pasta para cada turma
# 2. colar em cada pasta o arquivo .csv (ou .xls) com info doa alunos
# 3. colar nas pastas os respectivos arquivos .pdf com provas escaneadas
# 4. Mudar a pasta de trabalho para cada
# 5. 
# 6. verificar as provas com ERRO que foram movidas para a pasta 'manual'
#------------------------------------------------------------------------------


## modificando pasta de trabalho
setwd("/home/markus/Downloads/MAT02219EAD/2019_1/prova1/provas_scan/turmaO")  # mudar letra da turma!!!


## carrgando pacotes
library("exams")
library("stringr")
library("pdftools")
library("readxl")


#------------------------------------------------------------------------------
# geracao das provas

## lista de questões
myexam <- list(
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/definicoes2.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/Prob28_Cond.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/aed_boxplot.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/medidas_dados_agrupados2.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/Prob27_Cond.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/medidas_dados_agrupados.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/medidas_media_var_propriedades.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/questao_amostragem.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/questao_cigarro.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/Desc7_Dist-freq.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/definicoes4.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/definicoes3.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/definicoes1.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/boxplots.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/questao_um.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/questao_sete.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/questao_nove.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/Prob30_Bayes.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/Prob29_Bayes.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/Prob26_Teoremas.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/Prob25_Teoremas.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/Prob23_Teoremas.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/Prob22_Prod-Prob.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/Prob21_Prod-Prob.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/Prob20_Venn.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/Prob19_Venn.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/Prob18_Enum.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/medidas_media_var.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/medidas_media_ponderada.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/medidas_media_cv.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/medidas_def.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/questao_um_marcia.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/questao_tipo_variavel.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/questao_media_ponderada.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/questao_frequencia_media.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/questao_bayes.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/Desc8_Dist-freq.Rmd",
  "/home/markus/Downloads/MAT02219EAD/2019_1/banco_questoes/questao_arroz.Rmd"
)


## gerando prova
ex1 <- exams2nops(myexam, n = 5, language = "modelo.dcf", #edir = "", 
                  dir = "prova1", name = "Prova_1",
                  title = "MAT02219 - Probabilidade e Estatistica - Prova 1",
                  institution = "UFRGS", logo = NULL,
                  replacement = F, 
                  blank = 0, duplex = F, samepage = T,
                  reglength = 8,
                  points = c(1,1,1,2,2,3), showpoints = TRUE)


## gerando solucionario
exams2pdf(myexam, n = 5, language = "modelo.dcf", #edir = "", 
                  dir = "prova1",
                  title = "MAT02219 - Probabilidade e Estatistica - Prova 1",
                  institution = "UFRGS", logo = NULL,
                  replacement = F, 
                  template = "solution.tex",
                  name = "mat02219_area1_sol_", date = "2019-04-24",# format(Sys.Date(), "%Y/%m/%d"),
                  blank = 0, duplex = FALSE, encoding = "UTF-8", 
                  points = rep(1, 10), showpoints = TRUE,
                  samepage = TRUE, twocolumn = F,
                  reglength = 8, nchoice = 5)


#------------------------------------------------------------------------------
# correcao das provas

## convertendo arquivos .pdf em .png
pdfs <- list.files(pattern = ".pdf", full.names = TRUE) # .pdf devem estar na pasta de trabalho
for(ii in 1:length(pdfs)) pdf_convert(pdfs[ii], format = "png", dpi = 300)


## lendo arquivos .png gerados 
img <- list.files(pattern = ".png", full.names = TRUE)  # lista os arquivos .png  
scan_out <- nops_scan(images = img, file = FALSE)       # verificação inicial
scan_out2 <- str_split_fixed(scan_out, " ", n = 2)      # cria banco com variavel indicando erros
# corrigindo as que nao tiveram erros 
nops_scan(img[scan_out2[,2] != "ERROR"])                 
# criando pasta com os erros 
dir.create("manual")                                    # cria pasta para correcao manual
file.copy(img[scan_out2[,2] == "ERROR"], "manual")      # copia provas com erros para pasta
unlink(img[scan_out2[,2] == "ERROR"]) # deletar???      # deleta provas com erros da pasta de trabalho


## importando banco com info dos alunos
banco <- read_excel("MAT02219_O_2019_1.xlsx")               # mudar letra da turma!!!
banco <- data.frame(registration = str_pad(banco[[2]], width = 8, side="left", pad="0"), name = banco[[3]], id = banco[[3]]) 
write.csv2(banco, "lista_alunos_o.csv", row.names = FALSE)  # mudar letra da turma!!!
banco_csv <- read.csv2("lista_alunos_o.csv")                # mudar letra da turma!!!


## corrigindo e criando saidas
objeto <- nops_eval(
  register = "lista_alunos_o.csv",
  solutions = "/home/markus/Downloads/MAT02219EAD/2019_1/prova1/mat02219_area1_.rds",
  scans = Sys.glob("nops_scan_*.zip"),
  results = "corrigido_turma_o",
  eval = exams_eval(partial = FALSE, negative = FALSE),
  #interactive = FALSE, 
  language = "pt-BR"
)


## salva informacoes da correcao
write.csv2(objeto, "notas_finais.csv")


#------------------------------------------------------------------------------
# envio de email com resultados

library(mailR)
sender <- "markus.stein@ufrgs.br"  
addressrecipients <- c("rodrigocpdosreis@gmail.com", "mhbarbian@gmail.com")
addressesemail <- send.mail(from = sender,to = recipients,
                            subject = "Ordenacao da especializacao",
                            body = "Body of the email",
                            smtp = list(host.name = "smtp.ufrgs.br", 
                                        port = 587),
                            authenticate = FALSE,
                            send = FALSE)
email$send() # execute to send email
##-----------------------------------------------------------------------------
## Codigo para geracao de provas e correcao dos resultados
##
## Equipe MAT02219-EAD 2019/1
##
## Passo a passo para correcao:
## 1. escanear as folhas de rosto da prova e converter para '.png'
## 2. leitura das provas usando a funcao 'nops_scan()'. (* erros na leitura?)
## 3. criar arquivo '.csv' com informacao dos alunos, se nao existir
## 3. correcao usando a funcao 'nops_eval()'
## 5. *mudar a pasta de trabalho para cada prova/semestre
## 5. *'pt-BR2' salvar???
## 6. verificar as provas com ERRO que foram movidas para a pasta 'manual'
## 7. enviar resultados 'html' por email?
##-----------------------------------------------------------------------------

## carregando pacotes
library("exams")
library("stringr")
library("pdftools")
library("readxl")
library("here")

##-----------------------------------------------------------------------------
## correcao das provas

## convertendo arquivo(s) .pdf em .png para cada prova
pdfs <- list.files(pattern = ".pdf", full.names = TRUE) # lista arquivos pdf na pasta
for(ii in 1:length(pdfs)) pdf_convert(pdfs[ii], format = "png", dpi = 300) 


## lendo arquivos .png e verificando erros 
img <- list.files(pattern = ".png", full.names = TRUE)  # lista os arquivos png  
scan_out <- nops_scan(images = img, file = FALSE)       # verificação inicial
scan_out2 <- str_split_fixed(scan_out, " ", n = 2)      # cria banco com variavel indicando erros


## corrigindo as provas que nao tiveram erros 
nops_scan(img[scan_out2[,2] != "ERROR"])                # CORRECAO!!!    


## criando pasta com os erros 
dir.create("manual")                                    # cria pasta para correcao manual
file.copy(img[scan_out2[,2] == "ERROR"], "manual")      # copia provas com erros para pasta
unlink(img[scan_out2[,2] == "ERROR"]) # deletar???      # deleta provas com erros da pasta de trabalho


## importando banco com informacao dos alunos
## ??? se nao existir o banco criar em '.csv' com os requisitos
# banco <- read_excel(here("lista_alunos_turmas.xlsx")) # cuidado com nome do arquivo!!!
# banco <- data.frame(registration = str_pad(banco[[2]], width = 8, side="left", 
#                                            pad="0"), name = banco[[3]], id = banco[[3]]) 
# write.csv2(banco, "lista_alunos.csv", row.names = FALSE)  
banco_csv <- read.csv2("lista_alunos.csv")                


## corrigindo e criando saidas
objeto <- nops_eval(
              register = here("lista_alunos.csv"),
              solutions = here("mat02219_area1_.rds"),
              scans = Sys.glob("nops_scan_*.zip"),
              results = "corrigido_prova1",
              eval = exams_eval(partial = FALSE, negative = FALSE),
              #interactive = FALSE, 
              language = "pt-BR2"
          )


## salva informacoes da correcao
write.csv2(objeto, "notas_prova1.csv")


#------------------------------------------------------------------------------
# envio de email com resultados
library(rJava)
library(mailR)
sender <- "sendermail@ufrgs.br"  
recipients <- c("anonymous1@gmail.com", "anonymous2@gmail.com")
email <- send.mail(from = sender, to = recipients,          # De:... Para:...
                   subject = "Ordenacao da especializacao", # Assunto do email
                   body = "Test!",                          # corpo do email
                   smtp = list(host.name = "smtp.ufrgs.br", 
                               port = 465, 
                               user.name = "username",      # no. cartao
                               passwd = "password",         # senha portal 
                               ssl = TRUE), 
                   authenticate = TRUE,
                   attach.files = c("Exam_anonymous.png"),   # html da correcao
                   send = FALSE,
                   debug = TRUE)
email$send() # execute to send email

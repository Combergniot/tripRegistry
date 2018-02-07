<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Zgloszenie2pdf</title>
        <link rel="stylesheet" type="text/css" href="resources/css/kosztorys.css">
        <link href="https://fonts.googleapis.com/css?family=Lato:100,400,400i,700,900&amp;subset=latin-ext" rel="stylesheet">

    </head>

    <body>


        <div class="logo"><img src="../../resources/img/logo_black.jpg"></div>


        <div class="address">
            <span>
                Biuro turystyczne "Copernicana"<br>
                ul. Żeglarska 31/1 87-100 Toruń<br>
                NIP: 955-195-13-70
            </span>

        </div>

        <hr class="hr-top">

        <div class="heading">ZGŁOSZENIE NR ${trip.id} Z DNIA ………</div>

        <div class="disclamer">Biuro Turystyczne COPERNICANA Anna Gajewska posiada wpis do rejestru Organizatorów Turystyki i Pośredników
            Turystycznych Marszałka Województwa Kujawsko – Pomorskiego pod nr rej. 198 oraz gwarancję ubezpieczeniową
            AXA Towarzystwo Ubezpieczeń i Reasekuracji S.A. o numerze 03.441.717
            Biuro Turystyczne COPERNICANA Anna Gajewska podlega Turystycznemu Funduszowi Gwarancyjnemu.</div>

        <div class="table-copernicana">
            <table>
                <tr>
                    <td>
                        <c:forEach var="seeing" items="${trip.attractionsWithGuide}"> 
                            ${seeing.name} ${seeing.date}, Od ${seeing.hourFrom} do ${seeing.hourTo} <br>
                        </c:forEach>  
                        <span class="table-cell-head-bottom">Nazwa i termin imprezy</span> </td>
                    <td> 
                        <c:forEach var="attraction" items="${trip.attractions}"> 
                            ${attraction.name} ${attraction.date}, Od ${attraction.hourFrom} do ${attraction.hourTo}  <br>
                        </c:forEach>  
                        <span class="table-cell-head-bottom">Atrakcje</span></td>
                    <td>
                        ${trip.costEstimate.meetingPlace}
                        <span class="table-cell-head-bottom">Miejsce spotkania</span>
                    </td>
                </tr>
            </table>
        </div>
        <div class="company-data">
            <span class="company-data-header">Dane firmy:</span>
            <span><b>Nazwa firmy:</b> ${trip.company.name} </span> 
            <span><b>Osoba zglaszająca:</b> ${trip.company.personName} </span> 
            <span><b>Adres:</b></span> 
            <span><b>NIP:</b>${trip.company.nip}</span>
            <span><b>Telefon kontaktowy:</b> ${trip.company.phone} </span> 
        </div>
        <div class="table-copernicana">
            <table>
                <thead>
                <td>Nazwa imprezy</td>
                <td>Liczba osób</td>
                <td>Cena</td>
                <td>Razem</td>
                </thead>
                <tr>
                    <td>Usługa turystyczna wg
                        zaakceptowanego
                        programu*</td>
                    <td>${trip.group.childrenNo + trip.group.adultsNo + trip.group.staffNo}</td>
                    <td></td>
                    <td></td>

                </tr>
            </table>
        </div>
        <div class="company-data">     
            <span><b>Do zapłaty:</b> ${trip.costEstimate.price}</span>
            <span></span><b>Zaliczka:</b> ${trip.costEstimate.advance}zł do dnia ${trip.costEstimate.advanceBefore}. </span>
        <span></span><b>Dopłata:</b> do dnia ${trip.costEstimate.wholeAmountBefore} </span>
    <span></span><b>Forma płatności:</b> ${trip.costEstimate.paymentType} </span>
<span></span><b>Nr konta:</b> 54 1140 2017 0000 4102 0687 3535 </span>
</div>

<div class="disclamer">
    W razie rezygnacji ze strony klienta z zamówionych usług Biuro ma prawo do potrącenia kwoty jaką
    poniosło w związku z rezerwacją zleconych świadczeń.
</div>

<div class="heading">
    Czy wymagana jest FAKTURA TAK/NIE?
</div>

<div class="signature-wrapper">
    <div class="signature-left">
        [ Podpis touroperatora ]
    </div>
    <div class="signature-right">
        [ Podpis klienta ]
    </div>
</div>

<div class="disclamer disclamer-bottom">
    Wyrażam zgodę na przetwarzanie moich danych osobowych dla celów promocyjnych B.T. Copernicana (zgodnie z

    art.23 pkt.1 ustawy o ochronie danych osobowych z dnia 29.08.97) TAK / NIE
</div>

<hr>

<div class="invoice-data-bottom">
   
   <span>Numer konta bankowego</span> 
   <span>MultiBank o/Toruń Bre Bank S.A.</span> 
    <span>54 1140 2017 0000 4102 0687 3535</span>
    <span><b>www.copernicana.pl</b></span> 
</div>

<div class="address-data-bottom">
   <span>tel. 666-66-66</span> 
   <span>kom. 666-666-666</span> 
   <span>fax. 666-66-66</span>
   <span><b>biuro@copernicana.pl</b></span> 
</div>



</body>

</html>


<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="http://clients.mindbodyonline.com/api/0_5" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" targetNamespace="http://clients.mindbodyonline.com/api/0_5" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Provides methods and attributes relating to classes and enrollments.</wsdl:documentation>
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://clients.mindbodyonline.com/api/0_5">
      <s:element name="GetClasses">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="Request" type="tns:GetClassesRequest" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="GetClassesRequest">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBRequest">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="ClassDescriptionIDs" type="tns:ArrayOfInt" />
              <s:element minOccurs="0" maxOccurs="1" name="ClassIDs" type="tns:ArrayOfInt" />
              <s:element minOccurs="0" maxOccurs="1" name="StaffIDs" type="tns:ArrayOfLong" />
              <s:element minOccurs="1" maxOccurs="1" name="StartDateTime" nillable="true" type="s:dateTime" />
              <s:element minOccurs="1" maxOccurs="1" name="EndDateTime" nillable="true" type="s:dateTime" />
              <s:element minOccurs="0" maxOccurs="1" name="ClientID" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="ProgramIDs" type="tns:ArrayOfInt" />
              <s:element minOccurs="0" maxOccurs="1" name="SessionTypeIDs" type="tns:ArrayOfInt" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="MBRequest">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="SourceCredentials" type="tns:SourceCredentials" />
          <s:element minOccurs="0" maxOccurs="1" name="UserCredentials" type="tns:UserCredentials" />
          <s:element minOccurs="1" maxOccurs="1" name="XMLDetail" nillable="true" type="tns:XMLDetailLevel" />
          <s:element minOccurs="1" maxOccurs="1" name="PageSize" nillable="true" type="s:int" />
          <s:element minOccurs="1" maxOccurs="1" name="CurrentPageIndex" nillable="true" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="Fields" type="tns:ArrayOfString" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="SourceCredentials">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="SourceName" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Password" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="SiteIDs" type="tns:ArrayOfInt" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfInt">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="int" type="s:int" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="UserCredentials">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Username" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Password" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="SiteIDs" type="tns:ArrayOfInt" />
        </s:sequence>
      </s:complexType>
      <s:simpleType name="XMLDetailLevel">
        <s:restriction base="s:string">
          <s:enumeration value="Bare" />
          <s:enumeration value="Basic" />
          <s:enumeration value="Full" />
        </s:restriction>
      </s:simpleType>
      <s:complexType name="ArrayOfString">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="string" nillable="true" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfLong">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="long" type="s:long" />
        </s:sequence>
      </s:complexType>
      <s:element name="GetClassesResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetClassesResult" type="tns:GetClassesResult" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="GetClassesResult">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBResult">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="Classes" type="tns:ArrayOfClass" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="MBResult">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="Status" type="tns:StatusCode" />
          <s:element minOccurs="0" maxOccurs="1" name="Message" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="XMLDetail" type="tns:XMLDetailLevel" />
          <s:element minOccurs="1" maxOccurs="1" name="ResultCount" type="s:int" />
          <s:element minOccurs="1" maxOccurs="1" name="CurrentPageIndex" type="s:int" />
          <s:element minOccurs="1" maxOccurs="1" name="TotalPageCount" type="s:int" />
        </s:sequence>
      </s:complexType>
      <s:simpleType name="StatusCode">
        <s:restriction base="s:string">
          <s:enumeration value="Success" />
          <s:enumeration value="InvalidCredentials" />
          <s:enumeration value="InvalidParameters" />
          <s:enumeration value="InternalException" />
          <s:enumeration value="Unknown" />
          <s:enumeration value="FailedAction" />
        </s:restriction>
      </s:simpleType>
      <s:complexType name="ArrayOfClass">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="Class" nillable="true" type="tns:Class" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="Class">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBObject">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="Visits" type="tns:ArrayOfVisit" />
              <s:element minOccurs="0" maxOccurs="1" name="Clients" type="tns:ArrayOfClient" />
              <s:element minOccurs="0" maxOccurs="1" name="Location" type="tns:Location" />
              <s:element minOccurs="1" maxOccurs="1" name="MaxCapacity" nillable="true" type="s:int" />
              <s:element minOccurs="1" maxOccurs="1" name="WebCapacity" nillable="true" type="s:int" />
              <s:element minOccurs="1" maxOccurs="1" name="TotalBooked" nillable="true" type="s:int" />
              <s:element minOccurs="1" maxOccurs="1" name="WebBooked" nillable="true" type="s:int" />
              <s:element minOccurs="0" maxOccurs="1" name="Action" type="tns:ActionCode" />
              <s:element minOccurs="0" maxOccurs="1" name="ID" nillable="true" type="s:int" />
              <s:element minOccurs="0" maxOccurs="1" name="IsAvailable" nillable="true" type="s:boolean" />
              <s:element minOccurs="0" maxOccurs="1" name="StartDateTime" nillable="true" type="s:dateTime" />
              <s:element minOccurs="0" maxOccurs="1" name="EndDateTime" nillable="true" type="s:dateTime" />
              <s:element minOccurs="0" maxOccurs="1" name="ClassDescription" type="tns:ClassDescription" />
              <s:element minOccurs="0" maxOccurs="1" name="Staff" type="tns:Staff" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="MBObject">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Site" type="tns:Site" />
          <s:element minOccurs="0" maxOccurs="1" name="Messages" type="tns:ArrayOfString" />
          <s:element minOccurs="0" maxOccurs="1" name="Execute" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="Site">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="ID" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="Name" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="LogoURL" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="PageColor1" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="PageColor2" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="PageColor3" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="PageColor4" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="Resource">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBObject">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="Action" type="tns:ActionCode" />
              <s:element minOccurs="0" maxOccurs="1" name="ID" nillable="true" type="s:int" />
              <s:element minOccurs="0" maxOccurs="1" name="Name" type="s:string" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:simpleType name="ActionCode">
        <s:restriction base="s:string">
          <s:enumeration value="None" />
          <s:enumeration value="Added" />
          <s:enumeration value="Updated" />
          <s:enumeration value="Failed" />
        </s:restriction>
      </s:simpleType>
      <s:complexType name="ScheduleItem">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBObject" />
        </s:complexContent>
      </s:complexType>
      <s:complexType name="Appointment">
        <s:complexContent mixed="false">
          <s:extension base="tns:ScheduleItem">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="Action" type="tns:ActionCode" />
              <s:element minOccurs="0" maxOccurs="1" name="ID" nillable="true" type="s:long" />
              <s:element minOccurs="0" maxOccurs="1" name="Status" type="tns:AppointmentStatus" />
              <s:element minOccurs="0" maxOccurs="1" name="StartDateTime" nillable="true" type="s:dateTime" />
              <s:element minOccurs="0" maxOccurs="1" name="EndDateTime" nillable="true" type="s:dateTime" />
              <s:element minOccurs="0" maxOccurs="1" name="Notes" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="StaffRequested" nillable="true" type="s:boolean" />
              <s:element minOccurs="0" maxOccurs="1" name="Program" type="tns:Program" />
              <s:element minOccurs="0" maxOccurs="1" name="SessionType" type="tns:SessionType" />
              <s:element minOccurs="0" maxOccurs="1" name="Location" type="tns:Location" />
              <s:element minOccurs="0" maxOccurs="1" name="Staff" type="tns:Staff" />
              <s:element minOccurs="0" maxOccurs="1" name="Client" type="tns:Client" />
              <s:element minOccurs="0" maxOccurs="1" name="FirstAppointment" nillable="true" type="s:boolean" />
              <s:element minOccurs="0" maxOccurs="1" name="ClientService" type="tns:ClientService" />
              <s:element minOccurs="0" maxOccurs="1" name="Resources" type="tns:ArrayOfResource" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:simpleType name="AppointmentStatus">
        <s:restriction base="s:string">
          <s:enumeration value="Booked" />
          <s:enumeration value="Completed" />
          <s:enumeration value="Confirmed" />
          <s:enumeration value="Arrived" />
          <s:enumeration value="NoShow" />
        </s:restriction>
      </s:simpleType>
      <s:complexType name="Program">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBObject">
            <s:sequence>
              <s:element minOccurs="1" maxOccurs="1" name="ID" type="s:int" />
              <s:element minOccurs="0" maxOccurs="1" name="Name" type="s:string" />
              <s:element minOccurs="1" maxOccurs="1" name="ScheduleType" nillable="true" type="tns:ScheduleType" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:simpleType name="ScheduleType">
        <s:restriction base="s:string">
          <s:enumeration value="All" />
          <s:enumeration value="DropIn" />
          <s:enumeration value="Enrollment" />
          <s:enumeration value="Appointment" />
          <s:enumeration value="Resource" />
          <s:enumeration value="Media" />
          <s:enumeration value="Arrival" />
        </s:restriction>
      </s:simpleType>
      <s:complexType name="SessionType">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBObject">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="Action" type="tns:ActionCode" />
              <s:element minOccurs="0" maxOccurs="1" name="ID" nillable="true" type="s:int" />
              <s:element minOccurs="0" maxOccurs="1" name="Name" type="s:string" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="Location">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBObject">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="BusinessID" nillable="true" type="s:int" />
              <s:element minOccurs="0" maxOccurs="1" name="Action" type="tns:ActionCode" />
              <s:element minOccurs="0" maxOccurs="1" name="ID" nillable="true" type="s:int" />
              <s:element minOccurs="0" maxOccurs="1" name="Name" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Address" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Address2" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Tax1" nillable="true" type="s:float" />
              <s:element minOccurs="0" maxOccurs="1" name="Tax2" nillable="true" type="s:float" />
              <s:element minOccurs="0" maxOccurs="1" name="Tax3" nillable="true" type="s:float" />
              <s:element minOccurs="0" maxOccurs="1" name="Tax4" nillable="true" type="s:float" />
              <s:element minOccurs="0" maxOccurs="1" name="Tax5" nillable="true" type="s:float" />
              <s:element minOccurs="0" maxOccurs="1" name="Phone" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="City" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="StateProvCode" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="PostalCode" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Latitude" nillable="true" type="s:double" />
              <s:element minOccurs="0" maxOccurs="1" name="Longitude" nillable="true" type="s:double" />
              <s:element minOccurs="0" maxOccurs="1" name="DistanceInMiles" nillable="true" type="s:double" />
              <s:element minOccurs="0" maxOccurs="1" name="ImageURL" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Description" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="HasSite" nillable="true" type="s:boolean" />
              <s:element minOccurs="0" maxOccurs="1" name="CanBook" nillable="true" type="s:boolean" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="Staff">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBObject">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="Appointments" type="tns:ArrayOfAppointment" />
              <s:element minOccurs="0" maxOccurs="1" name="Unavailabilities" type="tns:ArrayOfUnavailability" />
              <s:element minOccurs="0" maxOccurs="1" name="Availabilities" type="tns:ArrayOfAvailability" />
              <s:element minOccurs="0" maxOccurs="1" name="Action" type="tns:ActionCode" />
              <s:element minOccurs="0" maxOccurs="1" name="ID" nillable="true" type="s:long" />
              <s:element minOccurs="0" maxOccurs="1" name="Name" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="FirstName" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="LastName" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="ImageURL" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Bio" type="s:string" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="ArrayOfAppointment">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="Appointment" nillable="true" type="tns:Appointment" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfUnavailability">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="Unavailability" nillable="true" type="tns:Unavailability" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="Unavailability">
        <s:complexContent mixed="false">
          <s:extension base="tns:ScheduleItem">
            <s:sequence>
              <s:element minOccurs="1" maxOccurs="1" name="ID" type="s:int" />
              <s:element minOccurs="1" maxOccurs="1" name="StartDateTime" type="s:dateTime" />
              <s:element minOccurs="1" maxOccurs="1" name="EndDateTime" type="s:dateTime" />
              <s:element minOccurs="0" maxOccurs="1" name="Description" type="s:string" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="ArrayOfAvailability">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="Availability" nillable="true" type="tns:Availability" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="Availability">
        <s:complexContent mixed="false">
          <s:extension base="tns:ScheduleItem">
            <s:sequence>
              <s:element minOccurs="1" maxOccurs="1" name="ID" type="s:int" />
              <s:element minOccurs="0" maxOccurs="1" name="Staff" type="tns:Staff" />
              <s:element minOccurs="0" maxOccurs="1" name="SessionType" type="tns:SessionType" />
              <s:element minOccurs="0" maxOccurs="1" name="Programs" type="tns:ArrayOfProgram" />
              <s:element minOccurs="1" maxOccurs="1" name="StartDateTime" type="s:dateTime" />
              <s:element minOccurs="1" maxOccurs="1" name="EndDateTime" type="s:dateTime" />
              <s:element minOccurs="1" maxOccurs="1" name="BookableEndDateTime" nillable="true" type="s:dateTime" />
              <s:element minOccurs="0" maxOccurs="1" name="Location" type="tns:Location" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="ArrayOfProgram">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="Program" nillable="true" type="tns:Program" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="Client">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBObject">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="NewID" type="s:double" />
              <s:element minOccurs="0" maxOccurs="1" name="AccountBalance" type="s:double" />
              <s:element minOccurs="0" maxOccurs="1" name="ClientIndexes" type="tns:ArrayOfClientIndex" />
              <s:element minOccurs="0" maxOccurs="1" name="Username" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Password" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Notes" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="ClientCreditCards" type="tns:ArrayOfClientCreditCard" />
              <s:element minOccurs="0" maxOccurs="1" name="LastFormulaNotes" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="AppointmentGenderPreference" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Gender" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="ClientRelationships" type="tns:ArrayOfClientRelationship" />
              <s:element minOccurs="0" maxOccurs="1" name="CustomClientFields" type="tns:ArrayOfCustomClientField" />
              <s:element minOccurs="0" maxOccurs="1" name="Action" type="tns:ActionCode" />
              <s:element minOccurs="0" maxOccurs="1" name="ID" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="FirstName" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="MiddleName" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="LastName" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Email" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="EmailOptIn" nillable="true" type="s:boolean" />
              <s:element minOccurs="0" maxOccurs="1" name="AddressLine1" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="AddressLine2" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="City" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="State" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="PostalCode" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Country" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="MobilePhone" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="HomePhone" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="WorkPhone" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="WorkExtension" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="BirthDate" nillable="true" type="s:dateTime" />
              <s:element minOccurs="0" maxOccurs="1" name="FirstAppointmentDate" nillable="true" type="s:dateTime" />
              <s:element minOccurs="0" maxOccurs="1" name="ReferredBy" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="HomeLocation" type="tns:Location" />
              <s:element minOccurs="0" maxOccurs="1" name="YellowAlert" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="RedAlert" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="PhotoURL" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="IsProspect" nillable="true" type="s:boolean" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="ArrayOfClientIndex">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="ClientIndex" nillable="true" type="tns:ClientIndex" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ClientIndex">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBObject">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="Action" type="tns:ActionCode" />
              <s:element minOccurs="0" maxOccurs="1" name="ID" nillable="true" type="s:int" />
              <s:element minOccurs="0" maxOccurs="1" name="Name" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Values" type="tns:ArrayOfClientIndexValue" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="ArrayOfClientIndexValue">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="ClientIndexValue" nillable="true" type="tns:ClientIndexValue" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ClientIndexValue">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBObject">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="Action" type="tns:ActionCode" />
              <s:element minOccurs="0" maxOccurs="1" name="ID" nillable="true" type="s:int" />
              <s:element minOccurs="0" maxOccurs="1" name="Name" type="s:string" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="ArrayOfClientCreditCard">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="ClientCreditCard" nillable="true" type="tns:ClientCreditCard" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ClientCreditCard">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="CardType" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="LastFour" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="CardHolder" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ExpMonth" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ExpYear" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Address" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="PostalCode" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfClientRelationship">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="ClientRelationship" nillable="true" type="tns:ClientRelationship" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ClientRelationship">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBObject">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="RelatedClient" type="tns:Client" />
              <s:element minOccurs="0" maxOccurs="1" name="Relationship" type="tns:Relationship" />
              <s:element minOccurs="0" maxOccurs="1" name="RelationshipName" type="s:string" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="Relationship">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="ID" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="RelationshipName1" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="RelationshipName2" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfCustomClientField">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="CustomClientField" nillable="true" type="tns:CustomClientField" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="CustomClientField">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="ID" type="s:int" />
          <s:element minOccurs="0" maxOccurs="1" name="DataType" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Name" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Value" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ClientService">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBObject">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="Action" type="tns:ActionCode" />
              <s:element minOccurs="0" maxOccurs="1" name="ID" nillable="true" type="s:long" />
              <s:element minOccurs="0" maxOccurs="1" name="Name" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="PaymentDate" nillable="true" type="s:dateTime" />
              <s:element minOccurs="0" maxOccurs="1" name="ActiveDate" nillable="true" type="s:dateTime" />
              <s:element minOccurs="0" maxOccurs="1" name="ExpirationDate" nillable="true" type="s:dateTime" />
              <s:element minOccurs="0" maxOccurs="1" name="Program" type="tns:Program" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="ArrayOfResource">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="Resource" nillable="true" type="tns:Resource" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ClassDescription">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBObject">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="Action" type="tns:ActionCode" />
              <s:element minOccurs="0" maxOccurs="1" name="ID" nillable="true" type="s:int" />
              <s:element minOccurs="0" maxOccurs="1" name="Name" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Description" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Prereq" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="Notes" type="s:string" />
              <s:element minOccurs="0" maxOccurs="1" name="LastUpdated" nillable="true" type="s:dateTime" />
              <s:element minOccurs="0" maxOccurs="1" name="Program" type="tns:Program" />
              <s:element minOccurs="0" maxOccurs="1" name="SessionType" type="tns:SessionType" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="Visit">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBObject">
            <s:sequence>
              <s:element minOccurs="1" maxOccurs="1" name="ID" type="s:long" />
              <s:element minOccurs="0" maxOccurs="1" name="Client" type="tns:Client" />
              <s:element minOccurs="1" maxOccurs="1" name="WebSignup" type="s:boolean" />
              <s:element minOccurs="1" maxOccurs="1" name="Action" type="tns:ActionCode" />
              <s:element minOccurs="1" maxOccurs="1" name="SignedIn" type="s:boolean" />
              <s:element minOccurs="1" maxOccurs="1" name="MakeUp" nillable="true" type="s:boolean" />
              <s:element minOccurs="0" maxOccurs="1" name="Service" type="tns:ClientService" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="ArrayOfVisit">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="Visit" nillable="true" type="tns:Visit" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfClient">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="Client" nillable="true" type="tns:Client" />
        </s:sequence>
      </s:complexType>
      <s:element name="UpdateClientVisits">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="Request" type="tns:UpdateClientVisitsRequest" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="UpdateClientVisitsRequest">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBRequest">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="Visits" type="tns:ArrayOfVisit" />
              <s:element minOccurs="1" maxOccurs="1" name="Test" nillable="true" type="s:boolean" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:element name="UpdateClientVisitsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="UpdateClientVisitsResult" type="tns:UpdateClientVisitsResult" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="UpdateClientVisitsResult">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBResult">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="Visits" type="tns:ArrayOfVisit" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:element name="GetClassVisits">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="Request" type="tns:GetClassVisitsRequest" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="GetClassVisitsRequest">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBRequest">
            <s:sequence>
              <s:element minOccurs="1" maxOccurs="1" name="ClassID" type="s:int" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:element name="GetClassVisitsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetClassVisitsResult" type="tns:GetClassVisitsResult" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="GetClassVisitsResult">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBResult">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="Class" type="tns:Class" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:element name="GetClassDescriptions">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="Request" type="tns:GetClassDescriptionsRequest" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="GetClassDescriptionsRequest">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBRequest">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="ClassDescriptionIDs" type="tns:ArrayOfInt" />
              <s:element minOccurs="0" maxOccurs="1" name="ProgramIDs" type="tns:ArrayOfInt" />
              <s:element minOccurs="0" maxOccurs="1" name="StaffIDs" type="tns:ArrayOfLong" />
              <s:element minOccurs="0" maxOccurs="1" name="LocationIDs" type="tns:ArrayOfInt" />
              <s:element minOccurs="1" maxOccurs="1" name="StartClassDateTime" nillable="true" type="s:dateTime" />
              <s:element minOccurs="1" maxOccurs="1" name="EndClassDateTime" nillable="true" type="s:dateTime" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:element name="GetClassDescriptionsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetClassDescriptionsResult" type="tns:GetClassDescriptionsResult" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="GetClassDescriptionsResult">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBResult">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="ClassDescriptions" type="tns:ArrayOfClassDescription" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="ArrayOfClassDescription">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="ClassDescription" nillable="true" type="tns:ClassDescription" />
        </s:sequence>
      </s:complexType>
      <s:element name="GetEnrollments">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="Request" type="tns:GetEnrollmentsRequest" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="GetEnrollmentsRequest">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBRequest">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="LocationIDs" type="tns:ArrayOfInt" />
              <s:element minOccurs="0" maxOccurs="1" name="ClassScheduleIDs" type="tns:ArrayOfInt" />
              <s:element minOccurs="0" maxOccurs="1" name="StaffIDs" type="tns:ArrayOfLong" />
              <s:element minOccurs="0" maxOccurs="1" name="ProgramIDs" type="tns:ArrayOfInt" />
              <s:element minOccurs="0" maxOccurs="1" name="SessionTypeIDs" type="tns:ArrayOfInt" />
              <s:element minOccurs="1" maxOccurs="1" name="StartDate" nillable="true" type="s:dateTime" />
              <s:element minOccurs="1" maxOccurs="1" name="EndDate" nillable="true" type="s:dateTime" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:element name="GetEnrollmentsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetEnrollmentsResult" type="tns:GetEnrollmentsResult" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="GetEnrollmentsResult">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBResult">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="Enrollments" type="tns:ArrayOfClassSchedule" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="ArrayOfClassSchedule">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="ClassSchedule" nillable="true" type="tns:ClassSchedule" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ClassSchedule">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBObject">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="Classes" type="tns:ArrayOfClass" />
              <s:element minOccurs="0" maxOccurs="1" name="Clients" type="tns:ArrayOfClient" />
              <s:element minOccurs="0" maxOccurs="1" name="Action" type="tns:ActionCode" />
              <s:element minOccurs="0" maxOccurs="1" name="ID" nillable="true" type="s:int" />
              <s:element minOccurs="0" maxOccurs="1" name="ClassDescription" type="tns:ClassDescription" />
              <s:element minOccurs="0" maxOccurs="1" name="DaySunday" nillable="true" type="s:boolean" />
              <s:element minOccurs="0" maxOccurs="1" name="DayMonday" nillable="true" type="s:boolean" />
              <s:element minOccurs="0" maxOccurs="1" name="DayTuesday" nillable="true" type="s:boolean" />
              <s:element minOccurs="0" maxOccurs="1" name="DayWednesday" nillable="true" type="s:boolean" />
              <s:element minOccurs="0" maxOccurs="1" name="DayThursday" nillable="true" type="s:boolean" />
              <s:element minOccurs="0" maxOccurs="1" name="DayFriday" nillable="true" type="s:boolean" />
              <s:element minOccurs="0" maxOccurs="1" name="DaySaturday" nillable="true" type="s:boolean" />
              <s:element minOccurs="0" maxOccurs="1" name="StartTime" nillable="true" type="s:dateTime" />
              <s:element minOccurs="0" maxOccurs="1" name="EndTime" nillable="true" type="s:dateTime" />
              <s:element minOccurs="0" maxOccurs="1" name="StartDate" nillable="true" type="s:dateTime" />
              <s:element minOccurs="0" maxOccurs="1" name="EndDate" nillable="true" type="s:dateTime" />
              <s:element minOccurs="0" maxOccurs="1" name="Staff" type="tns:Staff" />
              <s:element minOccurs="0" maxOccurs="1" name="Location" type="tns:Location" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:element name="GetClassSchedules">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="Request" type="tns:GetClassSchedulesRequest" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="GetClassSchedulesRequest">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBRequest">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="LocationIDs" type="tns:ArrayOfInt" />
              <s:element minOccurs="0" maxOccurs="1" name="ClassScheduleIDs" type="tns:ArrayOfInt" />
              <s:element minOccurs="0" maxOccurs="1" name="StaffIDs" type="tns:ArrayOfLong" />
              <s:element minOccurs="0" maxOccurs="1" name="ProgramIDs" type="tns:ArrayOfInt" />
              <s:element minOccurs="0" maxOccurs="1" name="SessionTypeIDs" type="tns:ArrayOfInt" />
              <s:element minOccurs="1" maxOccurs="1" name="StartDate" nillable="true" type="s:dateTime" />
              <s:element minOccurs="1" maxOccurs="1" name="EndDate" nillable="true" type="s:dateTime" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:element name="GetClassSchedulesResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetClassSchedulesResult" type="tns:GetClassSchedulesResult" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="GetClassSchedulesResult">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBResult">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="ClassSchedules" type="tns:ArrayOfClassSchedule" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:element name="AddClientsToClasses">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="Request" type="tns:AddClientsToClassesRequest" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="AddClientsToClassesRequest">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBRequest">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="ClientIDs" type="tns:ArrayOfString" />
              <s:element minOccurs="0" maxOccurs="1" name="ClassIDs" type="tns:ArrayOfInt" />
              <s:element minOccurs="1" maxOccurs="1" name="Test" nillable="true" type="s:boolean" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:element name="AddClientsToClassesResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="AddClientsToClassesResult" type="tns:AddClientsToClassesResult" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="AddClientsToClassesResult">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBResult">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="Classes" type="tns:ArrayOfClass" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:element name="AddClientsToEnrollments">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="Request" type="tns:AddClientsToEnrollmentsRequest" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="AddClientsToEnrollmentsRequest">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBRequest">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="ClientIDs" type="tns:ArrayOfString" />
              <s:element minOccurs="0" maxOccurs="1" name="ClassScheduleIDs" type="tns:ArrayOfInt" />
              <s:element minOccurs="1" maxOccurs="1" name="EnrollDateForward" nillable="true" type="s:dateTime" />
              <s:element minOccurs="0" maxOccurs="1" name="EnrollOpen" type="tns:ArrayOfDateTime" />
              <s:element minOccurs="1" maxOccurs="1" name="Test" nillable="true" type="s:boolean" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="ArrayOfDateTime">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="dateTime" type="s:dateTime" />
        </s:sequence>
      </s:complexType>
      <s:element name="AddClientsToEnrollmentsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="AddClientsToEnrollmentsResult" type="tns:AddClientsToEnrollmentsResult" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="AddClientsToEnrollmentsResult">
        <s:complexContent mixed="false">
          <s:extension base="tns:MBResult">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="Enrollments" type="tns:ArrayOfClassSchedule" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
    </s:schema>
  </wsdl:types>
  <wsdl:message name="GetClassesSoapIn">
    <wsdl:part name="parameters" element="tns:GetClasses" />
  </wsdl:message>
  <wsdl:message name="GetClassesSoapOut">
    <wsdl:part name="parameters" element="tns:GetClassesResponse" />
  </wsdl:message>
  <wsdl:message name="UpdateClientVisitsSoapIn">
    <wsdl:part name="parameters" element="tns:UpdateClientVisits" />
  </wsdl:message>
  <wsdl:message name="UpdateClientVisitsSoapOut">
    <wsdl:part name="parameters" element="tns:UpdateClientVisitsResponse" />
  </wsdl:message>
  <wsdl:message name="GetClassVisitsSoapIn">
    <wsdl:part name="parameters" element="tns:GetClassVisits" />
  </wsdl:message>
  <wsdl:message name="GetClassVisitsSoapOut">
    <wsdl:part name="parameters" element="tns:GetClassVisitsResponse" />
  </wsdl:message>
  <wsdl:message name="GetClassDescriptionsSoapIn">
    <wsdl:part name="parameters" element="tns:GetClassDescriptions" />
  </wsdl:message>
  <wsdl:message name="GetClassDescriptionsSoapOut">
    <wsdl:part name="parameters" element="tns:GetClassDescriptionsResponse" />
  </wsdl:message>
  <wsdl:message name="GetEnrollmentsSoapIn">
    <wsdl:part name="parameters" element="tns:GetEnrollments" />
  </wsdl:message>
  <wsdl:message name="GetEnrollmentsSoapOut">
    <wsdl:part name="parameters" element="tns:GetEnrollmentsResponse" />
  </wsdl:message>
  <wsdl:message name="GetClassSchedulesSoapIn">
    <wsdl:part name="parameters" element="tns:GetClassSchedules" />
  </wsdl:message>
  <wsdl:message name="GetClassSchedulesSoapOut">
    <wsdl:part name="parameters" element="tns:GetClassSchedulesResponse" />
  </wsdl:message>
  <wsdl:message name="AddClientsToClassesSoapIn">
    <wsdl:part name="parameters" element="tns:AddClientsToClasses" />
  </wsdl:message>
  <wsdl:message name="AddClientsToClassesSoapOut">
    <wsdl:part name="parameters" element="tns:AddClientsToClassesResponse" />
  </wsdl:message>
  <wsdl:message name="AddClientsToEnrollmentsSoapIn">
    <wsdl:part name="parameters" element="tns:AddClientsToEnrollments" />
  </wsdl:message>
  <wsdl:message name="AddClientsToEnrollmentsSoapOut">
    <wsdl:part name="parameters" element="tns:AddClientsToEnrollmentsResponse" />
  </wsdl:message>
  <wsdl:portType name="Class_x0020_ServiceSoap">
    <wsdl:operation name="GetClasses">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Gets a list of classes.</wsdl:documentation>
      <wsdl:input message="tns:GetClassesSoapIn" />
      <wsdl:output message="tns:GetClassesSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="UpdateClientVisits">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Update a list of visits.</wsdl:documentation>
      <wsdl:input message="tns:UpdateClientVisitsSoapIn" />
      <wsdl:output message="tns:UpdateClientVisitsSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetClassVisits">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Gets a class with a list of clients.</wsdl:documentation>
      <wsdl:input message="tns:GetClassVisitsSoapIn" />
      <wsdl:output message="tns:GetClassVisitsSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetClassDescriptions">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Gets a list of class descriptions.</wsdl:documentation>
      <wsdl:input message="tns:GetClassDescriptionsSoapIn" />
      <wsdl:output message="tns:GetClassDescriptionsSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetEnrollments">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Gets a list of enrollments.</wsdl:documentation>
      <wsdl:input message="tns:GetEnrollmentsSoapIn" />
      <wsdl:output message="tns:GetEnrollmentsSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetClassSchedules">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Gets a list of class schedules.</wsdl:documentation>
      <wsdl:input message="tns:GetClassSchedulesSoapIn" />
      <wsdl:output message="tns:GetClassSchedulesSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="AddClientsToClasses">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Adds clients to classes (signup).</wsdl:documentation>
      <wsdl:input message="tns:AddClientsToClassesSoapIn" />
      <wsdl:output message="tns:AddClientsToClassesSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="AddClientsToEnrollments">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Adds clients to enrollments (signup).</wsdl:documentation>
      <wsdl:input message="tns:AddClientsToEnrollmentsSoapIn" />
      <wsdl:output message="tns:AddClientsToEnrollmentsSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="Class_x0020_ServiceSoap" type="tns:Class_x0020_ServiceSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="GetClasses">
      <soap:operation soapAction="http://clients.mindbodyonline.com/api/0_5/GetClasses" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="UpdateClientVisits">
      <soap:operation soapAction="http://clients.mindbodyonline.com/api/0_5/UpdateClientVisits" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetClassVisits">
      <soap:operation soapAction="http://clients.mindbodyonline.com/api/0_5/GetClassVisits" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetClassDescriptions">
      <soap:operation soapAction="http://clients.mindbodyonline.com/api/0_5/GetClassDescriptions" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetEnrollments">
      <soap:operation soapAction="http://clients.mindbodyonline.com/api/0_5/GetEnrollments" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetClassSchedules">
      <soap:operation soapAction="http://clients.mindbodyonline.com/api/0_5/GetClassSchedules" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddClientsToClasses">
      <soap:operation soapAction="http://clients.mindbodyonline.com/api/0_5/AddClientsToClasses" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddClientsToEnrollments">
      <soap:operation soapAction="http://clients.mindbodyonline.com/api/0_5/AddClientsToEnrollments" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="Class_x0020_Service">
    <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Provides methods and attributes relating to classes and enrollments.</wsdl:documentation>
    <wsdl:port name="Class_x0020_ServiceSoap" binding="tns:Class_x0020_ServiceSoap">
      <soap:address location="http://clients.mindbodyonline.com/api/0_5/ClassService.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>
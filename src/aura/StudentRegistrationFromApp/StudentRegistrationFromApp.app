<aura:application extends="force:slds">
    <aura:attribute name="showForm" type="Boolean" default="false"/>
    
    <aura:attribute name="dynamicLabel" type="String" default="Open Form" />
    
    <lightning:button label="{!v.dynamicLabel}" onclick="{!c.buttonClick}" />
    
    <aura:if isTrue="{!v.showForm}">
    	<c:StudentRegistrationFrom />
     </aura:if>
    
</aura:application>
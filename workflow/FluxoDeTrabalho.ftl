<?xml version="1.0"?>

<workflow-definition
	xmlns="urn:liferay.com:liferay-workflow_7.4.0"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="urn:liferay.com:liferay-workflow_7.4.0 http://www.liferay.com/dtd/liferay-workflow-definition_7_4_0.xsd"
>
	<version>23</version>
	<state>
		<name>31e0cf41-83b2-416e-a767-11cd58093364</name>
		<description>Iniciar um fluxo de trabalho.</description>
		<metadata>
			<![CDATA[
				{
					"xy": [
						-228.62307870013134,
						129.67859491315903
					]
				}
			]]>
		</metadata>
		<actions>
			<notification>
				<name>Confirmção Da solicitação Reembolso</name>
				<description>
					<![CDATA[Aviso ao usuario que ele enviou a solicitção com sucesso.]]>
				</description>
				<template>
					<![CDATA[Ola, sua solicitação de reembolso foi enviada com sucesso! Aguarde a resposta da nossa Loja.]]>
				</template>
				<template-language>freemarker</template-language>
				<notification-type>user-notification</notification-type>
				<recipients receptionType="to">
					<user />
				</recipients>
				<execution-type>onExit</execution-type>
			</notification>
		</actions>
		<initial>true</initial>
		<labels>
			<label language-id="pt_BR">
				Solicitação Reembolso
			</label>
		</labels>
		<transitions>
			<transition>
				<labels>
					<label language-id="pt_BR">
						Reemolso enviado
					</label>
				</labels>
				<name>e69779be-c6ce-4e74-8f27-095861eaeee3</name>
				<target>7ecaa70e-02a3-4cc4-abbd-22c8936a869b</target>
				<default>true</default>
			</transition>
		</transitions>
	</state>
	<state>
		<name>fce7e335-81d1-4ed5-8567-6962276a73c2</name>
		<description>Reembolso Enviado</description>
		<metadata>
			<![CDATA[
				{
					"xy": [
						1176.1297668920938,
						107.99248226765997
					],
					"terminal": true
				}
			]]>
		</metadata>
		<actions>
			<action>
				<name>Reembolso Aprovado</name>
				<description>Reembolso Aprovado</description>
				<status>0</status>
				<priority>1</priority>
				<execution-type>onEntry</execution-type>
			</action>
			<notification>
				<name>Reembolso enviao ao cliente</name>
				<description>
					<![CDATA[Reembolso enviao ao cliente]]>
				</description>
				<template>
					<![CDATA[Ola seu reembolso foi enviado, obrigado por utilizar nossa plataforma, prazo de 3 dias.]]>
				</template>
				<template-language>text</template-language>
				<notification-type>user-notification</notification-type>
				<recipients receptionType="to">
					<user />
				</recipients>
				<execution-type>onEntry</execution-type>
			</notification>
		</actions>
		<labels>
			<label language-id="pt_BR">
				Reembolso Concluido
			</label>
		</labels>
	</state>
	<state>
		<name>e963b97d-08b6-45a8-bc49-e2f4f70cb989</name>
		<description>Recusar o reembolso do cliente</description>
		<metadata>
			<![CDATA[
				{
					"xy": [
						269.9314108953585,
						359.67315577618933
					],
					"terminal": true
				}
			]]>
		</metadata>
		<actions>
			<action>
				<name>Reembolso negado</name>
				<description>Reembolso negado por completo</description>
				<status>4</status>
				<priority>1</priority>
				<execution-type>onEntry</execution-type>
			</action>
			<notification>
				<name>Reembolso Negado</name>
				<description>
					<![CDATA[solicitação de reembolso negada]]>
				</description>
				<template>
					<![CDATA[Ola, Infelizmente sua solicitação de reembolso foi negada.]]>
				</template>
				<template-language>text</template-language>
				<notification-type>user-notification</notification-type>
				<recipients receptionType="to">
					<user />
				</recipients>
				<execution-type>onEntry</execution-type>
			</notification>
		</actions>
		<labels>
			<label language-id="pt_BR">
				Reembolso Negado
			</label>
		</labels>
	</state>
	<task>
		<name>bfb5b5ad-daf7-4e41-bc41-2a2ec910cb0a</name>
		<description>Diretor Revisa reembolso</description>
		<metadata>
			<![CDATA[
				{
					"xy": [
						579.7113737531836,
						-26.78132763119466
					]
				}
			]]>
		</metadata>
		<actions>
			<action>
				<name>Aceitar Reembolso</name>
				<description>Aceitar Reembolso</description>
				<status>6</status>
				<priority>1</priority>
				<execution-type>onAssignment</execution-type>
			</action>
			<action>
				<name>Recusar Reembolso</name>
				<description>Recusar Reembolso</description>
				<status>4</status>
				<priority>1</priority>
				<execution-type>onAssignment</execution-type>
			</action>
			<notification>
				<name>Gerente Aprovou Reembolso</name>
				<description>
					<![CDATA[Aprovação de reembolso por parte do gerente]]>
				</description>
				<template>
					<![CDATA[Gerente aprovou o reembolso do cliente.]]>
				</template>
				<template-language>text</template-language>
				<notification-type>user-notification</notification-type>
				<recipients receptionType="to">
					<roles>
						<role>
							<role-id>20101</role-id>
						</role>
					</roles>
				</recipients>
				<execution-type>onEntry</execution-type>
			</notification>
		</actions>
		<assignments>
			<roles>
				<role>
					<role-id>20101</role-id>
				</role>
			</roles>
		</assignments>
		<labels>
			<label language-id="pt_BR">
				Diretor
			</label>
		</labels>
		<transitions>
			<transition>
				<labels>
					<label language-id="pt_BR">
						Reembolso Aprovado Pelo Diretor
					</label>
				</labels>
				<name>97d558e2-c6d6-4a38-82b3-8330cc0d3afa</name>
				<target>07455121-8034-4817-a419-6f83d3f86dd9</target>
				<default>true</default>
			</transition>
			<transition>
				<labels>
					<label language-id="pt_BR">
						Reembolso Negado Pelo Diretor
					</label>
				</labels>
				<name>8d6d7ea5-2b16-471b-9977-612347a0634f</name>
				<target>e963b97d-08b6-45a8-bc49-e2f4f70cb989</target>
				<default>false</default>
			</transition>
		</transitions>
	</task>
	<task>
		<name>7ecaa70e-02a3-4cc4-abbd-22c8936a869b</name>
		<description>Gerente analisa reembolso</description>
		<metadata>
			<![CDATA[
				{
					"xy": [
						209.65190996725434,
						102.27385564892575
					]
				}
			]]>
		</metadata>
		<actions>
			<action>
				<name>Aceitar Reembolso</name>
				<description>Aceita a solitição de reembolso</description>
				<status>1</status>
				<priority>1</priority>
				<execution-type>onAssignment</execution-type>
			</action>
			<action>
				<name>Recusar Reembolso</name>
				<description>Recusar Reembolso do cliente</description>
				<status>4</status>
				<priority>1</priority>
				<execution-type>onAssignment</execution-type>
			</action>
			<notification>
				<name>Solicitação de reembolso recebida</name>
				<description>
					<![CDATA[Gerentes recebem a solicitação de reembolso]]>
				</description>
				<template>
					<![CDATA[Usuario solicitou um reembolso de algum produto.]]>
				</template>
				<template-language>text</template-language>
				<notification-type>user-notification</notification-type>
				<recipients receptionType="to">
					<roles>
						<role>
							<role-id>42918</role-id>
						</role>
					</roles>
				</recipients>
				<execution-type>onEntry</execution-type>
			</notification>
		</actions>
		<assignments>
			<roles>
				<role>
					<role-id>42918</role-id>
				</role>
			</roles>
		</assignments>
		<labels>
			<label language-id="pt_BR">
				Gerente
			</label>
		</labels>
		<transitions>
			<transition>
				<labels>
					<label language-id="pt_BR">
						Reembolso Negado Pelo Gerente
					</label>
				</labels>
				<name>ea6113c1-29b4-4755-a064-40a868631f55</name>
				<target>e963b97d-08b6-45a8-bc49-e2f4f70cb989</target>
				<default>true</default>
			</transition>
			<transition>
				<labels>
					<label language-id="pt_BR">
						Aprovado Pelo Gerente
					</label>
				</labels>
				<name>a0d717b6-91ad-44bc-b0fc-bb190538d211</name>
				<target>bfb5b5ad-daf7-4e41-bc41-2a2ec910cb0a</target>
				<default>false</default>
			</transition>
		</transitions>
	</task>
	<task>
		<name>07455121-8034-4817-a419-6f83d3f86dd9</name>
		<description>Financeiro aprova reembolso</description>
		<metadata>
			<![CDATA[
				{
					"xy": [
						741.9390869140625,
						106.17134094238281
					]
				}
			]]>
		</metadata>
		<actions>
			<action>
				<name>Enviar Reembolso</name>
				<description>Enviar Reembolso ao cliente</description>
				<status>1</status>
				<priority>1</priority>
				<execution-type>onAssignment</execution-type>
			</action>
			<notification>
				<name>Diretor aprovou reembolso de cliente</name>
				<description>
					<![CDATA[Diretor aprovou reembolso de cliente]]>
				</description>
				<template>
					<![CDATA[O Diretor aprovou o reembolso, analise os dados do cliente e envie o valor solicitado.]]>
				</template>
				<template-language>text</template-language>
				<notification-type>user-notification</notification-type>
				<recipients receptionType="to">
					<roles>
						<role>
							<role-id>20102</role-id>
						</role>
					</roles>
				</recipients>
				<execution-type>onEntry</execution-type>
			</notification>
		</actions>
		<assignments>
			<roles>
				<role>
					<role-id>20102</role-id>
				</role>
			</roles>
		</assignments>
		<labels>
			<label language-id="pt_BR">
				Financeiro
			</label>
		</labels>
		<transitions>
			<transition>
				<labels>
					<label language-id="pt_BR">
						Reembolso Aprovado
					</label>
				</labels>
				<name>908c8037-443e-464d-b25b-144d7f5ee675</name>
				<target>fce7e335-81d1-4ed5-8567-6962276a73c2</target>
				<default>true</default>
			</transition>
		</transitions>
	</task>
</workflow-definition>
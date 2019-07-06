<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>



<select id="tags_for_selection" class="selectpicker" multiple
    data-style="btn-success" data-max-options="4"
    title="请选择问题的标签(必选)" data-live-search="true">
    <optgroup label="database">
        <option>mysql</option>
        <option>oracle</option>
        <option>sqlserver</option>
        <option>mongodb</option>
        <option>redis</option>
        <option>postgresql</option>
    </optgroup>
    <optgroup label="language">
        <option>java</option>
        <option>php</option>
        <option>asp</option>
        <option>python</option>
        <option>c</option>
        <option>c++</option>
        <option>swift</option>
        <option>ruby</option>
    </optgroup>
    <optgroup label="tool">
        <option>eclipse</option>
        <option>atom</option>
        <option>maven</option>
        <option>ant</option>
        <option>vim</option>
    </optgroup>
    <optgroup label="others">
        <option>spring</option>
        <option>mybatis</option>
        <option>springmvc</option>
        <option>mybatis</option>
        <option>ssm</option>
        
        <option>others</option>
    </optgroup>
</select>

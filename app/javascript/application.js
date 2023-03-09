// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery3
//= require popper
//= require bootstrap-sprockets
// import "@hotwired/turbo-rails"

// 以下の2行のコードがないとjqueryを読み込んでくれない
import { Turbo } from "@hotwired/turbo-rails";
Turbo.session.drive = false;

import "controllers"

import jquery from "jquery";
window.$ = jquery;

$(function () {
//   // カテゴリーチャート、凡例のオンクリックイベント
//   $('.box, .cat-val, .cat-percent').click(function() {
//     $('#cat-chart').fadeOut();
//     $('#subcat-business').fadeIn();
//   });

//   // カテゴリーチャート
//   const areaA = Math.round($('li').eq(0).children('.cat-value').attr('data') * 3.6);
//   const areaB = Math.round($('li').eq(1).children('.cat-value').attr('data') * 3.6);
//   const areaC = Math.round($('li').eq(2).children('.cat-value').attr('data') * 3.6);
//   const areaD = Math.round($('li').eq(3).children('.cat-value').attr('data') * 3.6);
//   const areaE = Math.round($('li').eq(4).children('.cat-value').attr('data') * 3.6);
//   const areaF = Math.round($('li').eq(5).children('.cat-value').attr('data') * 3.6);
//   const areaG = Math.round($('li').eq(6).children('.cat-value').attr('data') * 3.6);
//   const areaH = Math.round($('li').eq(7).children('.cat-value').attr('data') * 3.6);
//   const areaI = Math.round($('li').eq(8).children('.cat-value').attr('data') * 3.6);

//   const areaAB = areaA + 'deg ' + ( areaA + areaB ) + 'deg';
//   const areaBC = areaA + areaB + 'deg ' + ( areaA + areaB + areaC ) + 'deg';
//   const areaCD = areaA + areaB + areaC + 'deg ' + ( areaA + areaB + areaC + areaD ) + 'deg';
//   const areaDE = areaA + areaB + areaC + areaD + 'deg ' + ( areaA + areaB + areaC + areaD + areaE ) + 'deg';
//   const areaEF = areaA + areaB + areaC + areaD + areaE + 'deg ' + ( areaA + areaB + areaC + areaD + areaE + areaF ) + 'deg';
//   const areaFG = areaA + areaB + areaC + areaD + areaE + areaF + 'deg ' + ( areaA + areaB + areaC + areaD + areaE + areaF + areaG ) + 'deg';
//   const areaGH = areaA + areaB + areaC + areaD + areaE + areaF + areaG + 'deg ' + ( areaA + areaB + areaC + areaD + areaE + areaF + areaG + areaH ) + 'deg';
//   const areaHI = areaA + areaB + areaC + areaD + areaE + areaF + areaG + areaH + 'deg ' + '360deg';

//   $('#cat-chart').css('background', 'conic-gradient(#ff7f7f ' + areaA + 'deg, #ff7fff ' +  areaAB + ', #7f7fff ' + areaBC +
//     ', #7fffff ' + areaCD + ', #7fff7f ' + areaDE + ', #ffff7f ' + areaEF + ', #ffbf7f ' + areaFG + ', #20b2aa ' + areaGH + ', #d3d3d3 ' + areaHI + ')');

//   // ビジネス、サブカテゴリーチャート
//   const areaA_1 = Math.round($('.li-business').eq(0).children('.subcat-value').attr('data') * 3.6);
//   const areaB_1 = Math.round($('.li-business').eq(1).children('.subcat-value').attr('data') * 3.6);
//   const areaC_1 = Math.round($('.li-business').eq(2).children('.subcat-value').attr('data') * 3.6);
//   const areaD_1 = Math.round($('.li-business').eq(3).children('.subcat-value').attr('data') * 3.6);

//   const areaAB_1 = areaA_1 + 'deg ' + ( areaA_1 + areaB_1 ) + 'deg';
//   const areaBC_1 = areaA_1 + areaB_1 + 'deg ' + ( areaA_1 + areaB_1 + areaC_1 ) + 'deg';
//   const areaCD_1 = areaA_1 + areaB_1 + areaC_1 + 'deg ' + '360deg';

//   $('#subcat-business').css('background', 'conic-gradient(#ff7f7f ' + areaA_1 + 'deg, #ff7fff ' +  areaAB_1 + ', #7f7fff ' + areaBC_1 +
//     ', #7fffff ' + areaCD_1 + ')');

//   // 文芸、サブカテゴリーチャート
//   const areaA_2 = Math.round($('li').eq(0).children('.subcat-value').attr('data') * 3.6);
//   const areaB_2 = Math.round($('li').eq(1).children('.subcat-value').attr('data') * 3.6);
//   const areaC_2 = Math.round($('li').eq(2).children('.subcat-value').attr('data') * 3.6);
//   const areaD_2 = Math.round($('li').eq(3).children('.subcat-value').attr('data') * 3.6);
//   const areaE_2 = Math.round($('li').eq(4).children('.subcat-value').attr('data') * 3.6);
//   const areaF_2 = Math.round($('li').eq(5).children('.subcat-value').attr('data') * 3.6);
//   const areaG_2 = Math.round($('li').eq(6).children('.subcat-value').attr('data') * 3.6);
//   const areaH_2 = Math.round($('li').eq(7).children('.subcat-value').attr('data') * 3.6);
//   const areaI_2 = Math.round($('li').eq(8).children('.subcat-value').attr('data') * 3.6);
//   const areaJ_2 = Math.round($('li').eq(9).children('.subcat-value').attr('data') * 3.6);
//   const areaK_2 = Math.round($('li').eq(10).children('.subcat-value').attr('data') * 3.6);
//   const areaL_2 = Math.round($('li').eq(11).children('.subcat-value').attr('data') * 3.6);

//   const areaAB_2 = areaA_2 + 'deg ' + ( areaA_2 + areaB_2 ) + 'deg';
//   const areaBC_2 = areaA_2 + areaB_2 + 'deg ' + ( areaA_2 + areaB_2 + areaC_2 ) + 'deg';
//   const areaCD_2 = areaA_2 + areaB_2 + areaC_2 + 'deg ' + ( areaA_2 + areaB_2 + areaC_2 + areaD_2 ) + 'deg';
//   const areaDE_2 = areaA_2 + areaB_2 + areaC_2 + areaD_2 + 'deg ' + ( areaA_2 + areaB_2 + areaC_2 + areaD_2 + areaE_2 ) + 'deg';
//   const areaEF_2 = areaA_2 + areaB_2 + areaC_2 + areaD_2 + areaE_2 + 'deg ' + ( areaA_2 + areaB_2 + areaC_2 + areaD_2 + areaE_2 + areaF_2 ) + 'deg';
//   const areaFG_2 = areaA_2 + areaB_2 + areaC_2 + areaD_2 + areaE_2 + areaF_2 + 'deg ' + ( areaA_2 + areaB_2 + areaC_2 + areaD_2 + areaE_2 + areaF_2 + areaG_2 ) + 'deg';
//   const areaGH_2 = areaA_2 + areaB_2 + areaC_2 + areaD_2 + areaE_2 + areaF_2 + areaG_2 + 'deg ' + ( areaA_2 + areaB_2 + areaC_2 + areaD_2 + areaE_2 + areaF_2 + areaG_2 + areaH_2 ) + 'deg';
//   const areaHI_2 = areaA_2 + areaB_2 + areaC_2 + areaD_2 + areaE_2 + areaF_2 + areaG_2 + areaH_2 + 'deg ' + ( areaA_2 + areaB_2 + areaC_2 + areaD_2 + areaE_2 + areaF_2 + areaG_2 + areaH_2 + areaI_2 ) + 'deg';
//   const areaIJ_2 = areaA_2 + areaB_2 + areaC_2 + areaD_2 + areaE_2 + areaF_2 + areaG_2 + areaH_2 + areaI_2 + 'deg ' + ( areaA_2 + areaB_2 + areaC_2 + areaD_2 + areaE_2 + areaF_2 + areaG_2 + areaH_2 + areaI_2 + areaJ_2 ) + 'deg';
//   const areaJK_2 = areaA_2 + areaB_2 + areaC_2 + areaD_2 + areaE_2 + areaF_2 + areaG_2 + areaH_2 + areaI_2 + areaJ_2 + 'deg ' + ( areaA_2 + areaB_2 + areaC_2 + areaD_2 + areaE_2 + areaF_2 + areaG_2 + areaH_2 + areaI_2 + areaJ_2 + areaK_2 ) + 'deg';
//   const areaKL_2 = areaA_2 + areaB_2 + areaC_2 + areaD_2 + areaE_2 + areaF_2 + areaG_2 + areaH_2 + areaI_2 + areaJ_2 + areaK_2 + 'deg ' + '360deg';

//   $('#subcat-literature').css('background', 'conic-gradient(#ff7f7f ' + areaA_2 + 'deg, #ff7fff ' +  areaAB_2 + ', #7f7fff ' + areaBC_2 + ', #7fffff ' + areaCD_2 + ', #7fff7f ' + areaDE_2 +
//     ', #ffff7f ' + areaEF_2 + ', #ffbf7f ' + areaFG_2 + ', #ff7fbf ' + areaGH_2 + ', #bf7fff ' + areaHI_2 + ', #7fbfff ' + areaIJ_2 + ', #7fffbf ' + areaJK_2 + ', #bfff7f ' + areaKL_2 + ')');

//   // 一般・教養、サブカテゴリーチャート
  
//   const areaA_3 = Math.round($('li').eq(0).children('.subcat-value').attr('data') * 3.6);
//   const areaB_3 = Math.round($('li').eq(1).children('.subcat-value').attr('data') * 3.6);
//   const areaC_3 = Math.round($('li').eq(2).children('.subcat-value').attr('data') * 3.6);
//   const areaD_3 = Math.round($('li').eq(3).children('.subcat-value').attr('data') * 3.6);
//   const areaE_3 = Math.round($('li').eq(4).children('.subcat-value').attr('data') * 3.6);
//   const areaF_3 = Math.round($('li').eq(5).children('.subcat-value').attr('data') * 3.6);

//   const areaAB_3 = areaA_3 + 'deg ' + ( areaA_3 + areaB_3 ) + 'deg';
//   const areaBC_3 = areaA_3 + areaB_3 + 'deg ' + ( areaA_3 + areaB_3 + areaC_3 ) + 'deg';
//   const areaCD_3 = areaA_3 + areaB_3 + areaC_3 + 'deg ' + ( areaA_3 + areaB_3 + areaC_3 + areaD_3 ) + 'deg';
//   const areaDE_3 = areaA_3 + areaB_3 + areaC_3 + areaD_3 + 'deg ' + ( areaA_3 + areaB_3 + areaC_3 + areaD_3 + areaE_3 ) + 'deg';
//   const areaEF_3 = areaA_3 + areaB_3 + areaC_3 + areaD_3 + areaE_3 + 'deg ' + '360deg';

//   $('#subcat-liberal_arts').css('background', 'conic-gradient(#ff7f7f ' + areaA_3 + 'deg, #ff7fff ' +  areaAB_3 + ', #7f7fff ' + areaBC_3 +
//     ', #7fffff ' + areaCD_3 + ', #7fff7f ' + areaDE_3 + ', #ffff7f ' + areaEF_3 + ')');

//   // 旅行ガイド、サブカテゴリーチャート
//   const areaA_4 = Math.round($('li').eq(0).children('.subcat-value').attr('data') * 3.6);
//   const areaB_4 = Math.round($('li').eq(1).children('.subcat-value').attr('data') * 3.6);
//   const areaC_4 = Math.round($('li').eq(2).children('.subcat-value').attr('data') * 3.6);
//   const areaD_4 = Math.round($('li').eq(3).children('.subcat-value').attr('data') * 3.6);
//   const areaE_4 = Math.round($('li').eq(4).children('.subcat-value').attr('data') * 3.6);

//   const areaAB_4 = areaA_4 + 'deg ' + ( areaA_4 + areaB_4 ) + 'deg';
//   const areaBC_4 = areaA_4 + areaB_4 + 'deg ' + ( areaA_4 + areaB_4 + areaC_4 ) + 'deg';
//   const areaCD_4 = areaA_4 + areaB_4 + areaC_4 + 'deg ' + ( areaA_4 + areaB_4 + areaC_4 + areaD_4 ) + 'deg';
//   const areaDE_4 = areaA_4 + areaB_4 + areaC_4 + areaD_4 + 'deg ' + '360deg';

//   $('#subcat-travel').css('background', 'conic-gradient(#ff7f7f ' + areaA_4 + 'deg, #ff7fff ' +  areaAB_4 + ', #7f7fff ' + areaBC_4 +
//     ', #7fffff ' + areaCD_4 + ', #7fff7f ' + areaDE_4 + ')');

//   // 趣味実用、サブカテゴリーチャート
//   const areaA_5 = Math.round($('li').eq(0).children('.subcat-value').attr('data') * 3.6);
//   const areaB_5 = Math.round($('li').eq(1).children('.subcat-value').attr('data') * 3.6);
//   const areaC_5 = Math.round($('li').eq(2).children('.subcat-value').attr('data') * 3.6);
//   const areaD_5 = Math.round($('li').eq(3).children('.subcat-value').attr('data') * 3.6);
//   const areaE_5 = Math.round($('li').eq(4).children('.subcat-value').attr('data') * 3.6);
//   const areaF_5 = Math.round($('li').eq(5).children('.subcat-value').attr('data') * 3.6);
//   const areaG_5 = Math.round($('li').eq(6).children('.subcat-value').attr('data') * 3.6);
//   const areaH_5 = Math.round($('li').eq(7).children('.subcat-value').attr('data') * 3.6);
//   const areaI_5 = Math.round($('li').eq(8).children('.subcat-value').attr('data') * 3.6);
//   const areaJ_5 = Math.round($('li').eq(9).children('.subcat-value').attr('data') * 3.6);
//   const areaK_5 = Math.round($('li').eq(10).children('.subcat-value').attr('data') * 3.6);
//   const areaL_5 = Math.round($('li').eq(11).children('.subcat-value').attr('data') * 3.6);
//   const areaM_5 = Math.round($('li').eq(12).children('.subcat-value').attr('data') * 3.6);
//   const areaN_5 = Math.round($('li').eq(13).children('.subcat-value').attr('data') * 3.6);
//   const areaO_5 = Math.round($('li').eq(14).children('.subcat-value').attr('data') * 3.6);

//   const areaAB_5 = areaA_5 + 'deg ' + ( areaA_5 + areaB_5 ) + 'deg';
//   const areaBC_5 = areaA_5 + areaB_5 + 'deg ' + ( areaA_5 + areaB_5 + areaC_5 ) + 'deg';
//   const areaCD_5 = areaA_5 + areaB_5 + areaC_5 + 'deg ' + ( areaA_5 + areaB_5 + areaC_5 + areaD_5 ) + 'deg';
//   const areaDE_5 = areaA_5 + areaB_5 + areaC_5 + areaD_5 + 'deg ' + ( areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 ) + 'deg';
//   const areaEF_5 = areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 + 'deg ' + ( areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 + areaF_5 ) + 'deg';
//   const areaFG_5 = areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 + areaF_5 + 'deg ' + ( areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 + areaF_5 + areaG_5 ) + 'deg';
//   const areaGH_5 = areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 + areaF_5 + areaG_5 + 'deg ' + ( areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 + areaF_5 + areaG_5 + areaH_5 ) + 'deg';
//   const areaHI_5 = areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 + areaF_5 + areaG_5 + areaH_5 + 'deg ' + ( areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 + areaF_5 + areaG_5 + areaH_5 + areaI_5 ) + 'deg';
//   const areaIJ_5 = areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 + areaF_5 + areaG_5 + areaH_5 + areaI_5 + 'deg ' + ( areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 + areaF_5 + areaG_5 + areaH_5 + areaI_5 + areaJ_5 ) + 'deg';
//   const areaJK_5 = areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 + areaF_5 + areaG_5 + areaH_5 + areaI_5 + areaJ_5 + 'deg ' + ( areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 + areaF_5 + areaG_5 + areaH_5 + areaI_5 + areaJ_5 + areaK_5 ) + 'deg';
//   const areaKL_5 = areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 + areaF_5 + areaG_5 + areaH_5 + areaI_5 + areaJ_5 + areaK_5 + 'deg ' + ( areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 + areaF_5 + areaG_5 + areaH_5 + areaI_5 + areaJ_5 + areaK_5 + areaK_5 ) + 'deg';
//   const areaLM_5 = areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 + areaF_5 + areaG_5 + areaH_5 + areaI_5 + areaJ_5 + areaK_5 + areaL_5 + 'deg ' + ( areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 + areaF_5 + areaG_5 + areaH_5 + areaI_5 + areaJ_5 + areaK_5 + areaK_5 + areaL_5 ) + 'deg';
//   const areaMN_5 = areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 + areaF_5 + areaG_5 + areaH_5 + areaI_5 + areaJ_5 + areaK_5 + areaL_5 + areaM_5 + 'deg ' + ( areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 + areaF_5 + areaG_5 + areaH_5 + areaI_5 + areaJ_5 + areaK_5 + areaK_5 + areaL_5 + areaM_5 ) + 'deg';
//   const areaNO_5 = areaA_5 + areaB_5 + areaC_5 + areaD_5 + areaE_5 + areaF_5 + areaG_5 + areaH_5 + areaI_5 + areaJ_5 + areaK_5 + areaL_5 + areaM_5 + areaN_5 + 'deg ' + '360deg';


//   $('#subcat-hobby_pratical').css('background', 'conic-gradient(#ff7f7f ' + areaA_5 + 'deg, #ff7fff ' +  areaAB_5 + ', #7f7fff ' + areaBC_5 + ', #7fffff ' + areaCD_5 + ', #7fff7f ' +
//     areaDE_5 + ', #ffff7f ' + areaEF_5 + ', #ffbf7f ' + areaFG_5 + ', #20b2aa ' + areaGH_5 + ', #d3d3d3 ' + areaHI_5 + ', #ff7fbf ' + areaIJ_5 + ', #bf7fff ' + areaJK_5 +
//     ', #7fbfff ' + areaKL_5 + ', #7fffbf ' + areaLM_5 + ', #bfff7f ' + areaMN_5 + ', #556b2f ' + areaNO_5 + ')');

//   // 自己啓発、サブカテゴリーチャート
//   const areaA_6 = Math.round($('li').eq(0).children('.subcat-value').attr('data') * 3.6);
//   const areaB_6 = Math.round($('li').eq(1).children('.subcat-value').attr('data') * 3.6);
//   const areaC_6 = Math.round($('li').eq(2).children('.subcat-value').attr('data') * 3.6);
//   const areaD_6 = Math.round($('li').eq(3).children('.subcat-value').attr('data') * 3.6);

//   const areaAB_6 = areaA_6 + 'deg ' + ( areaA_6 + areaB_6 ) + 'deg';
//   const areaBC_6 = areaA_6 + areaB_6 + 'deg ' + ( areaA_6 + areaB_6 + areaC_6 ) + 'deg';
//   const areaCD_6 = areaA_6 + areaB_6 + areaC_6 + 'deg ' + '360deg';

//   $('#subcat-self_enlightenment').css('background', 'conic-gradient(#ff7f7f ' + areaA_6 + 'deg, #ff7fff ' +  areaAB_6 + ', #7f7fff ' + areaBC_6 + ', #7fffff ' + areaCD_6 + ')');

//   // こども、サブカテゴリーチャート
//   const areaA_7 = Math.round($('li').eq(0).children('.subcat-value').attr('data') * 3.6);
//   const areaB_7 = Math.round($('li').eq(1).children('.subcat-value').attr('data') * 3.6);
//   const areaC_7 = Math.round($('li').eq(2).children('.subcat-value').attr('data') * 3.6);
//   const areaD_7 = Math.round($('li').eq(3).children('.subcat-value').attr('data') * 3.6);

//   const areaAB_7 = areaA_7 + 'deg ' + ( areaA_7 + areaB_7 ) + 'deg';
//   const areaBC_7 = areaA_7 + areaB_7 + 'deg ' + ( areaA_7 + areaB_7 + areaC_7 ) + 'deg';
//   const areaCD_7 = areaA_7 + areaB_7 + areaC_7 + 'deg ' + '360deg';

//   $('#subcat-children').css('background', 'conic-gradient(#ff7f7f ' + areaA_7 + 'deg, #ff7fff ' +  areaAB_7 + ', #7f7fff ' + areaBC_7 + ', #7fffff ' + areaCD_7 + ')');

//   // 教育・学習、サブカテゴリーチャート
//   const areaA_8 = Math.round($('li').eq(0).children('.subcat-value').attr('data') * 3.6);
//   const areaB_8 = Math.round($('li').eq(1).children('.subcat-value').attr('data') * 3.6);
//   const areaC_8 = Math.round($('li').eq(2).children('.subcat-value').attr('data') * 3.6);

//   const areaAB_8 = areaA_8 + 'deg ' + ( areaA_8 + areaB_8 ) + 'deg';
//   const areaBC_8 = areaA_8 + areaB_8 + 'deg ' + '360deg';

//   $('#subcat-education').css('background', 'conic-gradient(#ff7f7f ' + areaA_8 + 'deg, #ff7fff ' +  areaAB_8 + ', #7f7fff ' + areaBC_8 + ')');
  

//   // 本登録、サブカテゴリー選択肢 ////////////////////////////////////////
//   const business = [
//     { value: "ビジネス書", label: "ビジネス書" },
//     { value: "経営実務書", label: "経営実務書" },
//     { value: "投資・資産運用", label: "投資・資産運用" },
//     { value: "その他", label: "その他" },
//   ];

//   const literature = [
//     { value: "ミステリー・サスペンス", label: "ミステリー・サスペンス" },
//     { value: "冒険・アクション小説", label: "冒険・アクション小説" },
//     { value: "青春・恋愛小説", label: "青春・恋愛小説" },
//     { value: "時代・歴史小説", label: "時代・歴史小説" },
//     { value: "ホラー・幻想小説", label: "ホラー・幻想小説" },
//     { value: "経済小説", label: "経済小説" },
//     { value: "戦争シミュレーション小説", label: "戦争シミュレーション小説" },
//     { value: "その他の小説", label: "その他の小説" },
//     { value: "エッセイ", label: "エッセイ" },
//     { value: "詩歌集", label: "詩歌集" },
//     { value: "官能小説", label: "官能小説" },
//     { value: "その他", label: "その他" },
//   ];

//   const liberal_arts = [
//     { value: "一般書", label: "一般書" },
//     { value: "ノンフィクション", label: "ノンフィクション" },
//     { value: "科学・テクノロジー", label: "科学・テクノロジー" },
//     { value: "コンピュータ・IT", label: "コンピュータ・IT" },
//     { value: "歴史・地理", label: "歴史・地理" },
//     { value: "その他", label: "その他" },
//   ];

//   const travel = [
//     { value: "海外旅行ガイド", label: "海外旅行ガイド" },
//     { value: "国内旅行ガイド", label: "国内旅行ガイド" },
//     { value: "紀行文", label: "紀行文" },
//     { value: "旅行会話", label: "旅行会話" },
//     { value: "その他", label: "その他" },
//   ];

//   const hobby_practical = [
//     { value: "コミック", label: "コミック" },
//     { value: "スポーツ", label: "スポーツ" },
//     { value: "アウトドア", label: "アウトドア" },
//     { value: "健康", label: "健康" },
//     { value: "料理", label: "料理" },
//     { value: "食・グルメ", label: "食・グルメ" },
//     { value: "手芸", label: "手芸" },
//     { value: "女性向け", label: "女性向け" },
//     { value: "恋愛・結婚・離婚", label: "恋愛・結婚・離婚" },
//     { value: "ファッション・美容", label: "ファッション・美容" },
//     { value: "ペット", label: "ペット" },
//     { value: "エンターテイメント", label: "エンターテイメント" },
//     { value: "タレント本", label: "タレント本" },
//     { value: "写真集・画集", label: "写真集・画集" },
//     { value: "その他", label: "その他" },
//   ];

//   const self_enlightenment = [
//     { value: "自己啓発", label: "自己啓発" },
//     { value: "スピリチュアル", label: "スピリチュアル" },
//     { value: "勉強・資格", label: "勉強・資格" },
//     { value: "その他", label: "その他" },
//   ];

//   const children = [
//     {
//       value: "占い・おまじない・心理ゲーム",
//       label: "占い・おまじない・心理ゲーム",
//     },
//     { value: "児童文学・絵本", label: "児童文学・絵本" },
//     { value: "図鑑・自由研究", label: "図鑑・自由研究" },
//     { value: "その他", label: "その他" },
//   ];

//   const education = [
//     { value: "教育図書", label: "教育図書" },
//     { value: "語学ー英語", label: "語学ー英語" },
//     { value: "語学ーその他の言語", label: "語学ーその他の言語" },
//   ];

//   // カテゴリーが選択されたときに発火
//   $("[name=category]").change(function () {
//     let category = $(this).val();
//     console.log(category);

//     // categoryのhidden_fieldの値を変更 臨時対応
//     $("#category-field").val(category);

//     // サブカテゴリーを初期化
//     $("[name=subcategory]").children().remove();

//     switch (category) {
//       case "無分類":
//         $("[name=subcategory]").append(
//           $("<option>").attr({ value: "無分類" }).text("無分類")
//         );
//         $('#subcategory-field').val('無分類');
//         break;
//       case "ビジネス":
//         business.forEach(function (el) {
//           $("[name=subcategory]").append(
//             $("<option>").attr({ value: el.value }).text(el.label)
//           );
//         });
//         $('#subcategory-field').val('ビジネス書');
//         break;
//       case "文芸":
//         literature.forEach(function (el) {
//           $("[name=subcategory]").append(
//             $("<option>").attr({ value: el.value }).text(el.label)
//           );
//         });
//         $('#subcategory-field').val('ミステリー・サスペンス');
//         break;
//       case "一般・教養":
//         liberal_arts.forEach(function (el) {
//           $("[name=subcategory]").append(
//             $("<option>").attr({ value: el.value }).text(el.label)
//           );
//         });
//         $('#subcategory-field').val('一般書');
//         break;
//       case "旅行ガイド":
//         travel.forEach(function (el) {
//           $("[name=subcategory]").append(
//             $("<option>").attr({ value: el.value }).text(el.label)
//           );
//         });
//         $('#subcategory-field').val('海外旅行ガイド');
//         break;
//       case "趣味実用":
//         hobby_practical.forEach(function (el) {
//           $("[name=subcategory]").append(
//             $("<option>").attr({ value: el.value }).text(el.label)
//           );
//         });
//         $('#subcategory-field').val('コミック');
//         break;
//       case "自己啓発":
//         self_enlightenment.forEach(function (el) {
//           $("[name=subcategory]").append(
//             $("<option>").attr({ value: el.value }).text(el.label)
//           );
//         });
//         $('#subcategory-field').val('自己啓発');
//         break;
//       case "こども":
//         children.forEach(function (el) {
//           $("[name=subcategory]").append(
//             $("<option>").attr({ value: el.value }).text(el.label)
//           );
//         });
//         $('#subcategory-field').val('占い・おまじない');
//         break;
//       case "教育・学習":
//         education.forEach(function (el) {
//           $("[name=subcategory]").append(
//             $("<option>").attr({ value: el.value }).text(el.label)
//           );
//         });
//         $('#subcategory-field').val('教育図書');
//         break;
//     }
//   });

//   // subcategoryのhidden_fieldの値を変更 臨時対応
//   $("[name=subcategory]").change(function () {
//     let subcategory = $(this).val();
//     console.log(subcategory);
//     $("#subcategory-field").val(subcategory);
//   });

//   // 本棚タブ切り替え機能
//   $(".tab-label").click(function () {
//     $(".tab-content").css("display", "none");
//     $(".tab-label").removeClass("active");

//     let item_data = $(this).attr("data");
//     $(`#${item_data}`).css("display", "block");
//     $(this).addClass("active");
//   });

  // ページ更新時にモーダルがちらつき防止対策 //////////////////////////////////////
  $(".modal-block").css("display", "flex").hide();

  // モーダルオープン設定
  $(".grid-item").click(function () {
    // ビューから値を取得
    let src = $(this).find("img").attr("src");
    let bookdata = $(this).find(".bookdata").val();
    // Jsonにパース
    let data = JSON.parse(bookdata);

    $(".modal-block").fadeIn();
		
		// 項目の値を初期化
    $("#published_date").attr("value", "");

    // categoryのhidden_fieldの値を変更 臨時対応
    $("#category-field").val('無分類');
    // subcategoryのhidden_fieldの値を変更 臨時対応
    $("#subcategory-field").val('無分類');

		$('[name=category]').val('無分類');
    $("[name=subcategory]").children().remove();
		$("[name=subcategory]").append(
			$("<option>").attr({ value: "無分類" }).text("無分類")
		);

    // 取得した本のデータをモーダルに埋め込む
    $("#book-img").attr("src", src);
    $("#title-field").val(data.title);
    $("#author-field").val(data.author);
    if (data.published_date.length == 10)
      $("#published_date-field").attr("value", data.published_date);
    $("#published_date-field").attr("value", data.published_date);
    $("#publisher-field").val(data.publisher);
    $("#description-field").val(data.description);
    $("#thumbnail-field").val(data.thumbnail);
    $("#page_count-field").val(data.page_count);
    $("#isbn_10-field").val(data.isbn_10);
    $("#isbn_13-field").val(data.isbn_13);
  });

  // モーダルをクローズの設定 モーダル以外をクリックしたら閉じる
  $("#bookmodal-overlay, #modal-close").click(function () {
    $(".modal-block").fadeOut();
  });
});
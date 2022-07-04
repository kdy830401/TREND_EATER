package com.fpj.trendeater.board.model.service;

import java.util.ArrayList;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.board.model.vo.ApplyTastePerson;

public interface BoardService {

	Product selectPrBoard(int pno);

	ArrayList<Image> selectPrImage(int pno);

	int registerApplyTaste(ApplyTastePerson applyPerson);


}
